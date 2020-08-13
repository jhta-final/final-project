package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimMainDto;

public interface HomeDao {

	List<MoimMainDto> randomMoims();
	List<MoimMainDto> locationMoims(long locationNo);
}
