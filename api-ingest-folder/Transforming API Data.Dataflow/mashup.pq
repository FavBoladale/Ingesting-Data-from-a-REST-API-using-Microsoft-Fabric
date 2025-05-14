[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "weatherdata_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared weatherdata = let
  Source = Lakehouse.Contents([]),
  #"Navigation 1" = Source{[workspaceId = "17f6753b-b047-40f2-a213-5642959a1b3b"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "79f3876a-ba1b-42ae-a1a2-3d89dabfa112"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "weatherdata", ItemKind = "Table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 3", {{"list.dt_txt", type datetime}}),
  #"Renamed columns" = Table.RenameColumns(#"Changed column type", {{"list.dt_txt", "load_date"}})
in
  #"Renamed columns";
shared weatherdata_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "17f6753b-b047-40f2-a213-5642959a1b3b"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "79f3876a-ba1b-42ae-a1a2-3d89dabfa112"]}[Data],
  TableNavigation = Navigation_2{[Id = "transformed_weatherdata", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
