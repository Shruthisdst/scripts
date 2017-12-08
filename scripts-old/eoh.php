<?php

class dataModel extends Model {

	public function __construct() {

		parent::__construct();
	}
	
	public function getWords() {
		
		$fileName = XML_SRC_URL . DB_PREFIX . '.xml';

		if (!(file_exists(PHY_XML_SRC_URL . DB_PREFIX . '.xml'))) {
			return False;
		}
		
		$xml = simplexml_load_file($fileName);

		$words = array();

		foreach ($xml->volume as $volume)
		{
			foreach ($volume->entry as $entry) {
				$data['word'] = (string) $entry->head->word;
				array_push($words, $data);
			}
		}
		return $words;
	}
	public function getMetadaData() {
		
		$fileName = XML_SRC_URL . DB_PREFIX . '.xml';
		echo $fileName . "<br />";

		if (!(file_exists(PHY_XML_SRC_URL . DB_PREFIX . '.xml'))) {
			return False;
		}
		
		$xml = simplexml_load_file($fileName);

		$metaData = array();
		//~ $wordList = $this->getWords();
		//~ array_shift($wordList);

		foreach ($xml->volume as $volume)
		{
			$data['vnum'] = (string) $volume['vnum'];
			foreach ($volume->entry as $entry) {
				$data['word'] = (string) $entry->head->word;
				$data['description'] = $entry->saveXML();
				//~ echo $data['description'].'<br />';
				//~ foreach($wordList as $eachWord)
				//~ {
					//~ $data['description'] = preg_replace('/(\b' . $eachWord['word'] . '\b)|!(<ref href="'.$eachWord['word'].'">'.$eachWord['word'].'<\/ref>)/i', '<span class="linkword">' . $eachWord['word'] . '</span>', $data['description']);
					//~ $data['description'] = preg_replace('/<word><span class="linkword">(.*)<\/span><\/word>/', '<word>\1</word>', $data['description']);
					//~ $data['description'] = preg_replace('/<word>(.*)<span class="linkword">(.*)<\/span>(.*)<\/word>/', '<word>\1\2\3</word>', $data['description']);
					//~ $data['description'] = preg_replace('/<note>(.*)<span class="linkword">(.*)<\/span>(.*)<\/note>/', '<note>\1\2\3</note>', $data['description']);
				//~ }
				
				//~ $data['description'] = preg_replace('/<ref href="<span class="linkword">/', '<ref href="', $data['description']);
				//~ $data['description'] = preg_replace('/<ref href="(.*?)<span class="linkword">(.*?)">(.*?)<\/ref>/', '<ref href="\1\2">\3</ref>', $data['description']);
				//~ $data['description'] = preg_replace('/<span class="linkword">(.*?)">(.*?)<\/ref>/', '\1">\2</ref>', $data['description']);
				//~ $data['description'] = preg_replace('/<ref href="(.*?)<span class="linkword">/', '<ref href="\1', $data['description']);
				//~ $data['description'] = preg_replace('/<ref href="(.*?)">(.*?)<span class="linkword">/', '<ref href="\1">\2', $data['description']);
				//~ $data['description'] = preg_replace('/<\/span><\/ref>/', '</ref>', $data['description']);
				//~ $data['description'] = preg_replace('/<\/span>">/', '">', $data['description']);
				array_push($metaData, $data);
			}
		}
		return $metaData;
	}
}

?>
