import { TestBed } from '@angular/core/testing';

import { TraerTodosService } from './traer-todos.service';

describe('TraerTodosService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TraerTodosService = TestBed.get(TraerTodosService);
    expect(service).toBeTruthy();
  });
});
