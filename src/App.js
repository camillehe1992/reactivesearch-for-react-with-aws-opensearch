import "./App.css";
import "./styles.css";
import {
  ReactiveBase,
  SearchBox,
  MultiList,
  SingleRange,
  ReactiveList,
  ResultCard,
} from "@appbaseio/reactivesearch";

function App() {
  return (
    <ReactiveBase
      url="https://appbase-demo-ansible-abxiydt-arc.searchbase.io"
      app="good-books-ds"
      credentials="04717bb076f7:be54685e-db84-4243-975b-5b32ee241d31"
      enableAppbase
    >
      <div style={{ display: "flex", flexDirection: "row" }}>
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            width: "30%",
            margin: "10px",
          }}
        >
          <MultiList
            className="multilist"
            componentId="authorsfilter"
            dataField="authors.keyword"
            title="Filter by Authors"
            aggregationSize={5}
            innerClass={{
              input: "input-class",
            }}
          />
          <SingleRange
            componentId="ratingsfilter"
            dataField="average_rating"
            title="Filter by Ratings"
            data={[
              { start: 4, end: 5, label: "4 stars and up" },
              { start: 3, end: 5, label: "3 stars and up" },
            ]}
            defaultValue="4 stars and up"
          />
        </div>
        <div style={{ display: "flex", flexDirection: "column", width: "66%" }}>
          <SearchBox
            style={{
              marginTop: "35px",
            }}
            componentId="searchbox"
            dataField={[
              {
                field: "authors",
                weight: 3,
              },
              {
                field: "authors.autosuggest",
                weight: 1,
              },
              {
                field: "original_title",
                weight: 5,
              },
              {
                field: "original_title.autosuggest",
                weight: 1,
              },
            ]}
            placeholder="Search for books or authors"
          />
          <ReactiveList
            componentId="results"
            dataField="_score"
            size={6}
            pagination={true}
            react={{
              and: ["searchbox", "authorsfilter", "ratingsfilter"],
            }}
            style={{ textAlign: "center" }}
            render={({ data }) => (
              <ReactiveList.ResultCardsWrapper>
                {data.map((item) => (
                  <ResultCard key={item._id}>
                    <ResultCard.Image src={item.image} />
                    <ResultCard.Title
                      dangerouslySetInnerHTML={{
                        __html: item.original_title,
                      }}
                    />
                    <ResultCard.Description>
                      {item.authors + " " + "*".repeat(item.average_rating)}
                    </ResultCard.Description>
                  </ResultCard>
                ))}
              </ReactiveList.ResultCardsWrapper>
            )}
          />
        </div>
      </div>
    </ReactiveBase>
  );
}

export default App;
