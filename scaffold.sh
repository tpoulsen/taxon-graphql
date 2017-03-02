mix phoenix.gen.json LeafMargin leaf_margins name:string
mix phoenix.gen.json LeafShape leaf_shapes name:string
mix phoenix.gen.json LeafVenation leaf_venation name:string
mix phoenix.gen.json FruitType fruit_types name:string
mix phoenix.gen.json Distribution distributions area:string
mix phoenix.gen.json Plant plants common_name:string scientific_name:string leaf_margin:references:leaf_margins leaf_shape:references:leaf_shapes leaf_venation:references:leaf_venation fruit_type:references:fruit_types distribution:references:distributions
