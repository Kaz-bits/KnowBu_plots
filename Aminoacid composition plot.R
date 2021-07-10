
#----Aminoacid composition of a single sequence: p53----


#Sequence of the protein that we want to analyze. As an example 
#we choose p53 protein

p53 <- "MEEPQSDPSVEPPLSQETFSDLWKLLPENNVLSPLPSQAMDDLMLSPDDIEQWFTEDPGPDEAPRMPEAAPPVAPAPAAPTPAAPAPAPSWPLSSSVPSQKTYQGSYGFRLGFLHSGTAKSVTCTYSPALNKMFCQLAKTCPVQLWVDSTPPPGTRVRAMAIYKQSQHMTEVVRRCPHHERCSDSDGLAPPQHLIRVEGNLRVEYLDDRNTFRHSVVVPYEPPEVGSDCTTIHYNYMCNSSCMGGMNRRPILTIITLEDSSGNLLGRNSFEVRVCACPGRDRRTEEENLRKKGEPHHELPPGSTKRALPNNTSSSPQPKKKPLDGEYFTLQIRGRERFEMFRELNEALELKDAQAGKEPGGSRAHSSHLKSKKGQSTSRHKKLMFKTEGPDSD"

#Use the strsplit() function loaded in R base to split the every 
#aminoacid and save it in the same variable

p53 <- strsplit(p53, "")

#Use the table() function loaded in R base to determine the frequency 
#of the letters (aminoacid residues)

table(p53)

#Save the current output in a dataframe and change the columns name

df <- data.frame(table(p53))
names(df)[1] = "aminoacid"

#Create a plot using the ggplot package. The code for the final
#output is below

library(ggplot2)

ggplot(df, aes(x = aminoacid, y = Freq, fill = aminoacid)) + 
  theme_bw() +
  ggtitle("Aminoacid composition in the p53 protein") +
  labs(x = "Aminoacid (1-letter code)",
       y = "Frequency") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 11, face = "bold")) +
  scale_y_continuous(limits = c(0, 46), breaks = seq(0, 46, by = 4)) +
  geom_bar(stat = "identity", color ="black", width = 1, size = 0.8) +
  geom_text(aes(label = Freq), vjust = -0.5, colour = "black") + 
  scale_x_discrete(limits = df$aminoacid)

