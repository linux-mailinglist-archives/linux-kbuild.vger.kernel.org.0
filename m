Return-Path: <linux-kbuild+bounces-4594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0729C2A80
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 07:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B08081C20D9E
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 06:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CBF54652;
	Sat,  9 Nov 2024 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejztji8x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0A2BAFC;
	Sat,  9 Nov 2024 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731132400; cv=none; b=gv/ZDz5veATWzRoywR39yUS4vwluGkENmpsRZV6ck92cP4GhKbSVyjSKX9uvc7yXziGsHwzOHqDyDVPmMYKvX+44Qnr0qVxnLfbxVH55QZiq3GIYyZcBL6bnAyHjF6w23hewJDQoWHWW+LjU4zlxSuy3yBTqytt6S1LVGN4kP/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731132400; c=relaxed/simple;
	bh=EssCjhBoWZ6PJpUkZoP1yR4EE9L13/6dp1yLkzF6bvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTEi+7zmo8j+PrSvFQ8FEnZ10yfofDZqvF32fFfoBpUxv3J7O2paioePEB7VeYyc03CNNHRLrjh1SghSD7js9pPgEH8FTCNW3pLTh+dYATtqbHey+Fg3qfSA7u3kLfSCo9jC3B15+7YiRx00gAJ343OAgALDDC994WRVAKwPocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejztji8x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731132399; x=1762668399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EssCjhBoWZ6PJpUkZoP1yR4EE9L13/6dp1yLkzF6bvw=;
  b=ejztji8xM+Ply3daTgN+AyBzko1Z1WMWcVZN3m/J4MyQBir2PNtKj9Vm
   dCxtfLHHR5TgJ5IYDYiPff+wAiDHxDBNalYhb//S1Ph4zVyL3R1fgqa6s
   u6NQkAVY2c8e+A50AiNYjh9viDXaMXk5O+lPhu2akiwvWlPadPKqwAbAI
   xMQwRk5ZaBAyAG9PurkswI/kbOP8A/oev+z4SadAwYxkiMdp/UnGEhEEf
   P30+r/r0Uwo+Dx2mLO9RwnX8YVYYu/snexGs2hhqvPLcAPJTyDS2/dHyj
   VHEDGhZl5ZbCFMiFizg280Enl2QXZFaRs67O0Z714VqLB6BcZpP2wAF7T
   Q==;
X-CSE-ConnectionGUID: SmyNhQ3WToy+zUUoqPZQlQ==
X-CSE-MsgGUID: 9WWe2tfCQaC6JAh9dDr9kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30979100"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30979100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 22:06:39 -0800
X-CSE-ConnectionGUID: gZT81WXkQ0Ctap9y2ewrHw==
X-CSE-MsgGUID: 3fxBq18iQQamwZqD5UgREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="86702418"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2024 22:06:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9ecC-000s7q-2d;
	Sat, 09 Nov 2024 06:06:32 +0000
Date: Sat, 9 Nov 2024 14:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	netdev <netdev@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kbuild@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v4 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Message-ID: <202411091357.6tKo6nby-lkp@intel.com>
References: <20241108-packing-pack-fields-and-ice-implementation-v4-3-81a9f42c30e5@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-packing-pack-fields-and-ice-implementation-v4-3-81a9f42c30e5@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a84e8c05f58305dfa808bc5465c5175c29d7c9b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/lib-packing-create-__pack-and-__unpack-variants-without-error-checking/20241109-093307
base:   a84e8c05f58305dfa808bc5465c5175c29d7c9b6
patch link:    https://lore.kernel.org/r/20241108-packing-pack-fields-and-ice-implementation-v4-3-81a9f42c30e5%40intel.com
patch subject: [PATCH net-next v4 3/9] lib: packing: add pack_fields() and unpack_fields()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241109/202411091357.6tKo6nby-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091357.6tKo6nby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091357.6tKo6nby-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/packed_fields.c:15:
   scripts/mod/packed_fields.c: In function 'handle_packed_field_symbol':
>> scripts/mod/packed_fields.c:134:23: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'Elf32_Word' {aka 'unsigned int'} [-Wformat=]
     134 |                 error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ~~~~~~~~~~~~
         |                                              |
         |                                              Elf32_Word {aka unsigned int}
   scripts/mod/modpost.h:207:51: note: in definition of macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ^~~
   scripts/mod/packed_fields.c:134:50: note: format string is defined here
     134 |                 error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
         |                                                ~~^
         |                                                  |
         |                                                  long unsigned int
         |                                                %u
--
   In file included from scripts/mod/packed_fields.c:15:
   scripts/mod/packed_fields.c: In function 'handle_packed_field_symbol':
>> scripts/mod/packed_fields.c:134:23: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'Elf32_Word' {aka 'unsigned int'} [-Wformat=]
     134 |                 error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ~~~~~~~~~~~~
         |                                              |
         |                                              Elf32_Word {aka unsigned int}
   scripts/mod/modpost.h:207:51: note: in definition of macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ^~~
   scripts/mod/packed_fields.c:134:50: note: format string is defined here
     134 |                 error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
         |                                                ~~^
         |                                                  |
         |                                                  long unsigned int
         |                                                %u


vim +134 scripts/mod/packed_fields.c

    14	
  > 15	#include "modpost.h"
    16	
    17	typedef uint16_t	u16;
    18	typedef uint8_t		u8;
    19	
    20	#define BITS_PER_BYTE	8
    21	
    22	/* Big exception to the "don't include kernel headers into userspace", which
    23	 * even potentially has different endianness and word sizes, since we handle
    24	 * those differences explicitly below
    25	 */
    26	#include "../../include/linux/packing_types.h"
    27	
    28	#define max(a, b) ({\
    29			typeof(a) _a = a;\
    30			typeof(b) _b = b;\
    31			_a > _b ? _a : _b; })
    32	
    33	#define min(a, b) ({\
    34			typeof(a) _a = a;\
    35			typeof(b) _b = b;\
    36			_a < _b ? _a : _b; })
    37	
    38	struct packed_field_elem {
    39		uint64_t startbit;
    40		uint64_t endbit;
    41		uint64_t offset;
    42		uint64_t size;
    43	};
    44	
    45	enum field_type {
    46		UNKNOWN_SECTION,
    47		PACKED_FIELD_S,
    48		PACKED_FIELD_M,
    49	};
    50	
    51	enum element_order {
    52		FIRST_ELEMENT,
    53		SECOND_ELEMENT,
    54		ASCENDING_ORDER,
    55		DESCENDING_ORDER,
    56	};
    57	
    58	static size_t field_type_to_size(enum field_type type)
    59	{
    60		switch (type) {
    61		case PACKED_FIELD_S:
    62			return sizeof(struct packed_field_s);
    63		case PACKED_FIELD_M:
    64			return sizeof(struct packed_field_m);
    65		default:
    66			error("attempted to get field size for unknown packed field type %u\n",
    67			      type);
    68			return 0;
    69		}
    70	}
    71	
    72	static void get_field_contents(const void *data, enum field_type type,
    73				       struct packed_field_elem *elem)
    74	{
    75		switch (type) {
    76		case PACKED_FIELD_S: {
    77			const struct packed_field_s *data_field = data;
    78	
    79			elem->startbit = TO_NATIVE(data_field->startbit);
    80			elem->endbit = TO_NATIVE(data_field->endbit);
    81			elem->offset = TO_NATIVE(data_field->offset);
    82			elem->size = TO_NATIVE(data_field->size);
    83			return;
    84		}
    85		case PACKED_FIELD_M: {
    86			const struct packed_field_m *data_field = data;
    87	
    88			elem->startbit = TO_NATIVE(data_field->startbit);
    89			elem->endbit = TO_NATIVE(data_field->endbit);
    90			elem->offset = TO_NATIVE(data_field->offset);
    91			elem->size = TO_NATIVE(data_field->size);
    92			return;
    93		}
    94		default:
    95			error("attempted to get field contents for unknown packed field type %u\n",
    96			      type);
    97		}
    98	}
    99	
   100	void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
   101					Elf_Sym *sym, const char *symname)
   102	{
   103		unsigned int secindex = get_secindex(info, sym);
   104		struct packed_field_elem elem = {}, prev = {};
   105		enum element_order order = FIRST_ELEMENT;
   106		enum field_type type = UNKNOWN_SECTION;
   107		size_t field_size, count;
   108		const void *data, *ptr;
   109		const char *section;
   110	
   111		/* Skip symbols without a name */
   112		if (*symname == '\0')
   113			return;
   114	
   115		/* Skip symbols with invalid sections */
   116		if (secindex >= info->num_sections)
   117			return;
   118	
   119		section = sec_name(info, secindex);
   120	
   121		if (strcmp(section, ".rodata.packed_fields_s") == 0)
   122			type = PACKED_FIELD_S;
   123		else if (strcmp(section, ".rodata.packed_fields_m") == 0)
   124			type = PACKED_FIELD_M;
   125	
   126		/* Other sections don't relate to packed fields */
   127		if (type == UNKNOWN_SECTION)
   128			return;
   129	
   130		field_size = field_type_to_size(type);
   131	
   132		/* check that the data is a multiple of the size */
   133		if (sym->st_size % field_size != 0) {
 > 134			error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

