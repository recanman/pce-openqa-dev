# Copyright 2025 Pextra Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
use strict;
use warnings;

use Mojo::Base 'basetest';
use testapi;

sub run {
	my $iso = get_var('ISO');
	my $iso_size = -s $iso;

	# MiB -> bytes
	my $min_size = get_var('MIN_SIZE');
	my $min_size_bytes = $min_size * 1024 ** 2;

	my $max_size = get_var('MAX_SIZE') * 1024 ** 2;
	my $max_size_bytes = $max_size * 1024 ** 2;

	my $min_max_string = "(iso size: $iso_size bytes, min: $min_size_bytes bytes, max: $max_size_bytes bytes)";

	die "ISO size is less than minimum size $min_max_string" if $iso_size < $min_size_bytes;
	die "ISO size is greater than maximum size $min_max_string" if $iso_size > $max_size_bytes;
}

1;
