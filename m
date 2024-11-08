Return-Path: <linux-kbuild+bounces-4572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDA9C1C22
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 12:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6F921F23F42
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 11:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03D41E47AD;
	Fri,  8 Nov 2024 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHogBSV2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F9A1E32CE;
	Fri,  8 Nov 2024 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065056; cv=none; b=uGjG+5eq8dkjkcZG1h6snwAI0vQ55RU//O7EiG/RpvrVRnSj+yDUIsNyZBcbmZ2gYpJAhv5oWePassp6Qwj4GDwMhpe/TLqtziAZSuVUNyoIGNpzOQHhCsgtXScJhulfg/d9tn0oTXknLGOtNKQr26UYqul0Wzm5JC/yOF1tApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065056; c=relaxed/simple;
	bh=BNq9H/XymgkkGON9CiG/qFgqUUOZ5HexWYbCFh9Uk1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpHCBJbj396NWGlwvznwrNh//ZkyS5ipTwQ83Lp+IEztbXoklJWhsjRLCLyGjBfGZp8pNdZVC7ekM8DxdoybxlxmOiHMiR+eiv7aSKrOdZnanGkqqE8+DUK9lJtg2TV3ZCrHSMGjLar1NQxmZl9rf0b4KFJZzRqbLE+e25UvGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHogBSV2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a1e429b89so21499966b.1;
        Fri, 08 Nov 2024 03:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731065052; x=1731669852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5FKwrlKA0gRoHqm+ggKwJpmXrsNj8OQnuQ+yquGPnI=;
        b=iHogBSV26UmeKjPL37PKqnWJ55P/2qNJtRsjkrPzsdMHygvz4kCu/40berciohfgD5
         rPjynSZefOyTqyQex7dGe7Tk7+NsyxBESxNASxdc3WwVl/4mw9tviMqLh9S+4NCZOIRR
         XulHyb7U1plKonEo1fjVAHQ0Mav/6X7hH5crp+HooP3eXxOMByPy4eR0f9gsDjk7i8W+
         XQlf98k5swDA3WnWnK2D4+viI+/koy8LqiiHysCUyoc9cckk5eiuGZBDZ4CdiIcREmYo
         x6VZR0bup9bOrdEg57pmXOQUA3Fwkav4llI3din5YRMD6Y0P7Ku7fZ4ALOaqg1riFc9l
         pmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065052; x=1731669852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5FKwrlKA0gRoHqm+ggKwJpmXrsNj8OQnuQ+yquGPnI=;
        b=rnSGpFUuX/GrWYkam9xgALJ6q2Sj8jvCnEoKzKof5xNEJhRA1kyYDvWqEPakQ3S/TO
         BXXlhkGGE3K94DCgBHE9Ct3ireRhyJMY1jkWBrFKU6Kv4JRKDXt1ekQ0IodgfyNQf8vq
         t9KqjimUGZb9mauOyt9ja2qvo8BgmKXULAniK5X2PKX/fQ+UNmK0NtM2WQZ6x28XKpyo
         U53OMsTcRV7mVDKilwMlEFtycsJjoqexQAUgkpo5LiV+D5gMe3UiCzopjT41LPT5CTE9
         vgA8IwSiBd69qQO0bpn6Oi6PoA/2ezKdor3nb2IqI47wjXHH62VeexDa0aF9Eh9hoogD
         qaMg==
X-Forwarded-Encrypted: i=1; AJvYcCUrPZoPfAE5VT3gsN9ZHxCLn+tNVIcR74p2DczJE9tIKnkHM1/BhoRseqXukK+yhIVSa6Vj7B1uQstgZtU=@vger.kernel.org, AJvYcCXR1W58xy8NRNrPpBynZSvZrWx7uWTgLV3GTvcQxEZOujqVpSi7A2g0v8LgYv2W4LX46wDOyDzq@vger.kernel.org
X-Gm-Message-State: AOJu0YwPXWyrhOFPs4YA49U7un75IcbgtorbAc1h72Xs6PReIpyh72S/
	vf013WfjmVgMHWUNIn5u0tyWMeupKrnOCVbsiV34YWVAu1sJM/nE
X-Google-Smtp-Source: AGHT+IFapAsKYJmFNxEuHDY6V5F81JzLxdPvX7AtQ00567UcMtKijHgIbKOrlrOGMD5d9tSRwYWCpQ==
X-Received: by 2002:a17:907:9622:b0:a9a:4d32:2c7b with SMTP id a640c23a62f3a-a9eeffe9d8dmr87671066b.9.1731065051750;
        Fri, 08 Nov 2024 03:24:11 -0800 (PST)
Received: from skbuf ([188.25.106.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a46119sm220601466b.46.2024.11.08.03.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:24:10 -0800 (PST)
Date: Fri, 8 Nov 2024 13:24:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	netdev <netdev@vger.kernel.org>, linux-kbuild@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v3 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Message-ID: <20241108112407.3mg2aspg5h2vas4c@skbuf>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
 <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>

On Thu, Nov 07, 2024 at 11:50:34AM -0800, Jacob Keller wrote:
> +#define DECLARE_PACKED_FIELDS_S(name, buffer_sz) \
> +	const size_t __ ## name ## _buffer_sz __pf_section_s = buffer_sz; \
> +	const struct packed_field_s name[] __pf_section_s

This will need sorting out - how to make this declaration macro
compatible with the "static" keyword. The obvious way (to group the
field array and the buffer size into a structure) doesn't work. It loses
the ARRAY_SIZE() of the fields, which is important to the pack_fields()
and unpack_fields() wrappers.

Maybe a different tool is needed for checking that no packed fields
exceed the buffer size? Forcing the buffer size be a symbol just because
that's what modpost works with seems unnatural.

If we knew the position of the largest field array element in C, and if
we enforced that all pack_fields() use a strong type (size included) for
the packed buffer, we'd have all information inside the pack_fields()
macro, because we only need to compare the largest field against the
buffer size. We could just have that part as a BUILD_BUG_ON() wrapped
inside the pack_fields() macro itself. And have the compile-time checks
spill over between C and modpost...

Not to mention, pack_fields() would have one argument less: pbuflen.

> +
> +/* Medium packed field. Use with bit offsets < 65536, buffers < 8KB and
> + * unpacked structures < 64KB.
> + */
> +struct packed_field_m {
> +	GEN_PACKED_FIELD_MEMBERS(u16);
> +};
> +
> +#define __pf_section_m __section(".rodata.packed_fields_m")
> +
> +#define DECLARE_PACKED_FIELDS_M(name, buffer_sz) \
> +	const size_t __ ## name ## _buffer_sz __pf_section_m = buffer_sz; \
> +	const struct packed_field_m name[] __pf_section_m
> +
> +#define PACKED_FIELD(start, end, struct_name, struct_field) \
> +{ \
> +	(start), \
> +	(end), \
> +	offsetof(struct_name, struct_field), \
> +	sizeof_field(struct_name, struct_field), \
> +}
> +
> +#endif
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index ada3a36cc4bc..013bf4be2642 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -160,6 +160,19 @@ static inline bool is_valid_name(struct elf_info *elf, Elf_Sym *sym)
>  	return !is_mapping_symbol(name);
>  }
>  
> +/* This is based on the hash algorithm from gdbm, via tdb */
> +static inline unsigned int tdb_hash(const char *name)
> +{
> +	unsigned value;	/* Used to compute the hash value.  */
> +	unsigned   i;	/* Used to cycle through random values. */
> +
> +	/* Set the initial value from the key size. */
> +	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
> +		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
> +
> +	return (1103515243 * value + 12345);
> +}
> +

Code movement should be in separate changes.

>  /* symsearch.c */
>  void symsearch_init(struct elf_info *elf);
>  void symsearch_finish(struct elf_info *elf);
> @@ -175,12 +188,18 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
>  /* sumversion.c */
>  void get_src_version(const char *modname, char sum[], unsigned sumlen);
>  
> +/* packed_fields.c */
> +void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
> +				Elf_Sym *sym, const char *symname);
> +void check_packed_field_symbols(void);
> +
>  /* from modpost.c */
>  extern bool target_is_big_endian;
>  extern bool host_is_big_endian;
>  char *read_text_file(const char *filename);
>  char *get_line(char **stringp);
>  void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
> +const char *sec_name(const struct elf_info *info, unsigned int secindex);
>  
>  void __attribute__((format(printf, 2, 3)))
>  modpost_log(bool is_error, const char *fmt, ...);
> diff --git a/lib/packing.c b/lib/packing.c
> index 2bf81951dfc8..45164f73fe5b 100644
> --- a/lib/packing.c
> +++ b/lib/packing.c
> @@ -5,10 +5,37 @@
>  #include <linux/packing.h>
>  #include <linux/module.h>
>  #include <linux/bitops.h>
> +#include <linux/bits.h>
>  #include <linux/errno.h>
>  #include <linux/types.h>
>  #include <linux/bitrev.h>
>  
> +#define __pack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks)	\
> +	({									\
> +		for (size_t i = 0; i < (num_fields); i++) {			\
> +			typeof(&(fields)[0]) field = &(fields)[i];		\
> +			u64 uval;						\
> +										\
> +			uval = ustruct_field_to_u64(ustruct, field->offset, field->size); \
> +										\
> +			__pack(pbuf, uval, field->startbit, field->endbit,	\
> +			       pbuflen, quirks);				\
> +		}								\
> +	})
> +
> +#define __unpack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks)	\
> +	({									\
> +		for (size_t i = 0; i < (num_fields); i++) {			\
> +			typeof(&(fields)[0]) field = &fields[i];		\
> +			u64 uval;						\
> +										\
> +			__unpack(pbuf, &uval, field->startbit, field->endbit,	\
> +				 pbuflen, quirks);				\
> +										\
> +			u64_to_ustruct_field(ustruct, field->offset, field->size, uval); \
> +		}								\
> +	})
> +
>  /**
>   * calculate_box_addr - Determine physical location of byte in buffer
>   * @box: Index of byte within buffer seen as a logical big-endian big number
> @@ -168,8 +195,8 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
>  }
>  EXPORT_SYMBOL(pack);
>  
> -static void __unpack(const void *pbuf, u64 *uval, size_t startbit,
> -		     size_t endbit, size_t pbuflen, u8 quirks)
> +static void __unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
> +		     size_t pbuflen, u8 quirks)
>  {
>  	/* Logical byte indices corresponding to the
>  	 * start and end of the field.
> @@ -322,4 +349,122 @@ int packing(void *pbuf, u64 *uval, int startbit, int endbit, size_t pbuflen,
>  }
>  EXPORT_SYMBOL(packing);
>  
> +static u64 ustruct_field_to_u64(const void *ustruct, size_t field_offset,
> +				size_t field_size)
> +{
> +	switch (field_size) {
> +	case 1:
> +		return *((u8 *)(ustruct + field_offset));
> +	case 2:
> +		return *((u16 *)(ustruct + field_offset));
> +	case 4:
> +		return *((u32 *)(ustruct + field_offset));
> +	default:
> +		return *((u64 *)(ustruct + field_offset));
> +	}
> +}
> +
> +static void u64_to_ustruct_field(void *ustruct, size_t field_offset,
> +				 size_t field_size, u64 uval)
> +{
> +	switch (field_size) {
> +	case 1:
> +		*((u8 *)(ustruct + field_offset)) = uval;
> +		break;
> +	case 2:
> +		*((u16 *)(ustruct + field_offset)) = uval;
> +		break;
> +	case 4:
> +		*((u32 *)(ustruct + field_offset)) = uval;
> +		break;
> +	default:
> +		*((u64 *)(ustruct + field_offset)) = uval;
> +		break;
> +	}
> +}
> +
> +/**
> + * pack_fields_s - Pack array of small fields
> + *
> + * @pbuf: Pointer to a buffer holding the packed value.
> + * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
> + * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
> + *	     It is expected (but not checked) that this has the same data type
> + *	     as all struct packed_field_s definitions.
> + * @fields: Array of small packed fields definition. They must not overlap.
> + * @num_fields: Length of @fields array.
> + * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
> + *	    QUIRK_MSB_ON_THE_RIGHT.
> + */
> +void pack_fields_s(void *pbuf, size_t pbuflen, const void *ustruct,
> +		   const struct packed_field_s *fields, size_t num_fields,
> +		   u8 quirks)
> +{
> +	__pack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
> +}
> +EXPORT_SYMBOL(pack_fields_s);
> +
> +/**
> + * pack_fields_m - Pack array of medium fields
> + *
> + * @pbuf: Pointer to a buffer holding the packed value.
> + * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
> + * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
> + *	     It is expected (but not checked) that this has the same data type
> + *	     as all struct packed_field_s definitions.
> + * @fields: Array of medium packed fields definition. They must not overlap.
> + * @num_fields: Length of @fields array.
> + * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
> + *	    QUIRK_MSB_ON_THE_RIGHT.
> + */
> +void pack_fields_m(void *pbuf, size_t pbuflen, const void *ustruct,
> +		   const struct packed_field_m *fields, size_t num_fields,
> +		   u8 quirks)
> +{
> +	__pack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
> +}
> +EXPORT_SYMBOL(pack_fields_m);
> +
> +/**
> + * unpack_fields_s - Unpack array of small fields
> + *
> + * @pbuf: Pointer to a buffer holding the packed value.
> + * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
> + * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
> + *	     It is expected (but not checked) that this has the same data type
> + *	     as all struct packed_field_s definitions.
> + * @fields: Array of small packed fields definition. They must not overlap.
> + * @num_fields: Length of @fields array.
> + * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
> + *	    QUIRK_MSB_ON_THE_RIGHT.
> + */
> +void unpack_fields_s(const void *pbuf, size_t pbuflen, void *ustruct,
> +		     const struct packed_field_s *fields, size_t num_fields,
> +		     u8 quirks)
> +{
> +	__unpack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
> +}
> +EXPORT_SYMBOL(unpack_fields_s);
> +
> +/**
> + * unpack_fields_m - Unpack array of medium fields
> + *
> + * @pbuf: Pointer to a buffer holding the packed value.
> + * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
> + * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
> + *	     It is expected (but not checked) that this has the same data type
> + *	     as all struct packed_field_s definitions.
> + * @fields: Array of medium packed fields definition. They must not overlap.
> + * @num_fields: Length of @fields array.
> + * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
> + *	    QUIRK_MSB_ON_THE_RIGHT.
> + */
> +void unpack_fields_m(const void *pbuf, size_t pbuflen, void *ustruct,
> +		     const struct packed_field_m *fields, size_t num_fields,
> +		     u8 quirks)
> +{
> +	__unpack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
> +}
> +EXPORT_SYMBOL(unpack_fields_m);
> +
>  MODULE_DESCRIPTION("Generic bitfield packing and unpacking");
> diff --git a/lib/packing_test.c b/lib/packing_test.c
> index b38ea43c03fd..ff5be660de01 100644
> --- a/lib/packing_test.c
> +++ b/lib/packing_test.c

I appreciate the test.

> @@ -396,9 +396,70 @@ static void packing_test_unpack(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, uval, params->uval);
>  }
>  
> +#define PACKED_BUF_SIZE 8
> +
> +typedef struct __packed { u8 buf[PACKED_BUF_SIZE]; } packed_buf_t;
> +
> +struct test_data {
> +	u8 field1;
> +	u16 field2;
> +	u32 field3;
> +	u16 field4;
> +	u8 field5;
> +	u16 field6;

If you group the u8s with the u8s and with the odd u16, and the
remaining two u16s together, you should get a structure with less
padding.

> +};
> +
> +DECLARE_PACKED_FIELDS_S(test_fields, sizeof(packed_buf_t)) = {
> +	PACKED_FIELD(63, 61, struct test_data, field1),
> +	PACKED_FIELD(60, 52, struct test_data, field2),
> +	PACKED_FIELD(51, 28, struct test_data, field3),
> +	PACKED_FIELD(27, 14, struct test_data, field4),
> +	PACKED_FIELD(13, 9, struct test_data, field5),
> +	PACKED_FIELD(8, 0, struct test_data, field6),
> +};
> +
> +static void packing_test_pack_fields(struct kunit *test)
> +{
> +	const struct test_data data = {
> +		.field1 = 0x2,
> +		.field2 = 0x100,
> +		.field3 = 0xF00050,
> +		.field4 = 0x7D3,
> +		.field5 = 0x9,
> +		.field6 = 0x10B,
> +	};
> +	packed_buf_t buf = {};

Reverse Christmas tree (should come after "expect").

> +	packed_buf_t expect = {
> +		.buf = { 0x50, 0x0F, 0x00, 0x05, 0x01, 0xF4, 0xD3, 0x0B },
> +	};
> +
> +	pack_fields(&buf, sizeof(buf), &data, test_fields, 0);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &expect, &buf, sizeof(buf));
> +}
> +
> +static void packing_test_unpack_fields(struct kunit *test)
> +{
> +	const packed_buf_t buf = {
> +		.buf = { 0x17, 0x28, 0x10, 0x19, 0x3D, 0xA9, 0x07, 0x9C },
> +	};
> +	struct test_data data = {};

Reverse Christmas tree.

> +
> +	unpack_fields(&buf, sizeof(buf), &data, test_fields, 0);
> +
> +	KUNIT_EXPECT_EQ(test, 0, data.field1);
> +	KUNIT_EXPECT_EQ(test, 0x172, data.field2);
> +	KUNIT_EXPECT_EQ(test, 0x810193, data.field3);
> +	KUNIT_EXPECT_EQ(test, 0x36A4, data.field4);
> +	KUNIT_EXPECT_EQ(test, 0x3, data.field5);
> +	KUNIT_EXPECT_EQ(test, 0x19C, data.field6);
> +}
> +
>  static struct kunit_case packing_test_cases[] = {
>  	KUNIT_CASE_PARAM(packing_test_pack, packing_gen_params),
>  	KUNIT_CASE_PARAM(packing_test_unpack, packing_gen_params),
> +	KUNIT_CASE(packing_test_pack_fields),
> +	KUNIT_CASE(packing_test_unpack_fields),
>  	{},
>  };
>  
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 107393a8c48a..3f707bba18d7 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -209,19 +209,6 @@ struct symbol {
>  
>  static HASHTABLE_DEFINE(symbol_hashtable, 1U << 10);
>  
> -/* This is based on the hash algorithm from gdbm, via tdb */
> -static inline unsigned int tdb_hash(const char *name)
> -{
> -	unsigned value;	/* Used to compute the hash value.  */
> -	unsigned   i;	/* Used to cycle through random values. */
> -
> -	/* Set the initial value from the key size. */
> -	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
> -		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
> -
> -	return (1103515243 * value + 12345);
> -}
> -
>  /**
>   * Allocate a new symbols for use in the hash of exported symbols or
>   * the list of unresolved symbols per module
> @@ -327,7 +314,7 @@ static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
>  				      sechdr->sh_name);
>  }
>  
> -static const char *sec_name(const struct elf_info *info, unsigned int secindex)
> +const char *sec_name(const struct elf_info *info, unsigned int secindex)
>  {
>  	/*
>  	 * If sym->st_shndx is a special section index, there is no
> @@ -1602,6 +1589,7 @@ static void read_symbols(const char *modname)
>  
>  		handle_symbol(mod, &info, sym, symname);
>  		handle_moddevtable(mod, &info, sym, symname);
> +		handle_packed_field_symbol(mod, &info, sym, symname);
>  	}
>  
>  	check_sec_ref(mod, &info);
> @@ -2222,6 +2210,8 @@ int main(int argc, char **argv)
>  	if (missing_namespace_deps)
>  		write_namespace_deps_files(missing_namespace_deps);
>  
> +	check_packed_field_symbols();
> +
>  	if (dump_write)
>  		write_dump(dump_write);
>  	if (sec_mismatch_count && !sec_mismatch_warn_only)
> diff --git a/scripts/mod/packed_fields.c b/scripts/mod/packed_fields.c
> new file mode 100644
> index 000000000000..aa9dbd704e52
> --- /dev/null
> +++ b/scripts/mod/packed_fields.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2024, Intel Corporation. */
> +
> +/* Code to validate struct packed_field_[sm] data, and perform sanity checks
> + * to ensure the packed field data is laid out correctly and fits into the
> + * relevant buffer size.
> + */
> +
> +#include <fnmatch.h>
> +#include <hashtable.h>
> +#include <inttypes.h>
> +#include <stdint.h>
> +#include <xalloc.h>
> +
> +#include "modpost.h"
> +
> +typedef uint16_t	u16;
> +typedef uint8_t		u8;
> +
> +#define BITS_PER_BYTE	8
> +
> +/* Big exception to the "don't include kernel headers into userspace", which
> + * even potentially has different endianness and word sizes, since we handle
> + * those differences explicitly below
> + */
> +#include "../../include/linux/packing_types.h"
> +
> +struct packed_field_elem {
> +	uint64_t startbit;
> +	uint64_t endbit;
> +	uint64_t offset;
> +	uint64_t size;
> +};
> +
> +enum field_type {
> +	UNKNOWN_SECTION,
> +	PACKED_FIELD_S,
> +	PACKED_FIELD_M,
> +};
> +
> +static size_t field_type_to_size(enum field_type type)
> +{
> +	switch (type) {
> +	case PACKED_FIELD_S:
> +		return sizeof(struct packed_field_s);
> +	case PACKED_FIELD_M:
> +		return sizeof(struct packed_field_m);
> +	default:
> +		error("attempted to get field size for unknown packed field type %u\n",
> +		      type);
> +		return 0;
> +	}
> +}
> +
> +static void get_field_contents(const void *data, enum field_type type,
> +			       struct packed_field_elem *elem)
> +{
> +	switch (type) {
> +	case PACKED_FIELD_S: {
> +		const struct packed_field_s *data_field = data;
> +
> +		elem->startbit = TO_NATIVE(data_field->startbit);
> +		elem->endbit = TO_NATIVE(data_field->endbit);
> +		elem->offset = TO_NATIVE(data_field->offset);
> +		elem->size = TO_NATIVE(data_field->size);
> +		return;
> +	}
> +	case PACKED_FIELD_M: {
> +		const struct packed_field_m *data_field = data;
> +
> +		elem->startbit = TO_NATIVE(data_field->startbit);
> +		elem->endbit = TO_NATIVE(data_field->endbit);
> +		elem->offset = TO_NATIVE(data_field->offset);
> +		elem->size = TO_NATIVE(data_field->size);
> +		return;
> +	}
> +	default:
> +		error("attempted to get field contents for unknown packed field type %u\n",
> +		      type);
> +	}
> +}
> +
> +struct field_symbol {
> +	struct hlist_node hnode;
> +	enum field_type type;
> +	size_t buffer_size;
> +	size_t data_size;
> +	void *data;
> +	struct module *mod;
> +	char *name;
> +};
> +
> +static HASHTABLE_DEFINE(field_hashtable, 1U << 10);
> +
> +static struct field_symbol *alloc_field(char *name, struct module *mod)
> +{
> +	struct field_symbol *f = xmalloc(sizeof(*f));
> +
> +	memset(f, 0, sizeof(*f));
> +	f->mod = mod;
> +	f->name = name;
> +
> +	return f;
> +}
> +
> +static void hash_add_field(struct field_symbol *field)
> +{
> +	hash_add(field_hashtable, &field->hnode, tdb_hash(field->name));
> +}
> +
> +static struct field_symbol *find_field(const char *name, struct module *mod)
> +{
> +	struct field_symbol *f;
> +
> +	hash_for_each_possible(field_hashtable, f, hnode, tdb_hash(name)) {
> +		if (strcmp(f->name, name) == 0 && f->mod == mod)
> +			return f;
> +	}
> +	return NULL;
> +}
> +
> +void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
> +				Elf_Sym *sym, const char *symname)
> +{
> +	unsigned int secindex = get_secindex(info, sym);
> +	enum field_type type = UNKNOWN_SECTION;
> +	bool is_size_symbol = false;
> +	struct field_symbol *f;
> +	const char *section;
> +	char *name;
> +
> +	/* Skip symbols without a name */
> +	if (*symname == '\0')
> +		return;
> +
> +	/* Skip symbols with invalid sections */
> +	if (secindex >= info->num_sections)
> +		return;
> +
> +	section = sec_name(info, secindex);
> +
> +	if (strcmp(section, ".rodata.packed_fields_s") == 0)
> +		type = PACKED_FIELD_S;
> +	else if (strcmp(section, ".rodata.packed_fields_m") == 0)
> +		type = PACKED_FIELD_M;
> +
> +	/* Other sections don't relate to packed fields */
> +	if (type == UNKNOWN_SECTION)
> +		return;
> +
> +	name = xstrdup(symname);
> +
> +	/* Extract original field name from the size symbol */
> +	if (!fnmatch("__*_buffer_sz", name, 0)) {
> +		name += strlen("__");
> +		name[strlen(name) - strlen("_buffer_sz")] = '\0';
> +		is_size_symbol = true;
> +	}
> +
> +	f = find_field(name, mod);
> +	if (!f) {
> +		f = alloc_field(name, mod);
> +		f->type = type;
> +		hash_add_field(f);
> +	}
> +
> +	if (f->type != type) {
> +		error("%s and %s have mismatched packed field sections\n",
> +		      f->name, symname);
> +		return;
> +	}
> +
> +	if (is_size_symbol) {
> +		size_t *size_data = sym_get_data(info, sym);
> +		size_t size = TO_NATIVE(*size_data);
> +
> +		if (f->buffer_size && f->buffer_size != size) {
> +			error("%s has buffer size %zu, but symbol %s says the size should be %zu\n",
> +			      f->name, f->buffer_size, symname, size);
> +		}
> +
> +		f->buffer_size = size;
> +	} else {
> +		if (f->data)
> +			error("%s has multiple data symbols???\n",
> +			      f->name);
> +
> +		f->data_size = sym->st_size;
> +		f->data = xmalloc(f->data_size);
> +		memcpy(f->data, sym_get_data(info, sym), f->data_size);
> +	}
> +}
> +
> +enum element_order {
> +	FIRST_ELEMENT,
> +	SECOND_ELEMENT,
> +	ASCENDING_ORDER,
> +	DESCENDING_ORDER,
> +};

If you still keep this for next versions, this should go at the top,
before function definitions.

> +
> +static void check_packed_field_array(const struct field_symbol *f)
> +{
> +	struct packed_field_elem previous_elem = {};
> +	size_t field_size = field_type_to_size(f->type);
> +	enum element_order order = FIRST_ELEMENT;
> +	void *data_ptr;
> +	int count;

Stored as signed, printed as unsigned.

> +
> +	/* check that the data is a multiple of the size */
> +	if (f->data_size % field_size != 0) {
> +		error("symbol %s of module %s has size %zu which is not a multiple of the field size (%zu)\n",
> +		      f->name, f->mod->name, f->data_size, field_size);
> +		return;
> +	}
> +
> +	data_ptr = f->data;
> +	count = 0;

Initialization be wrapped into the declaration.

> +
> +	while (data_ptr < f->data + f->data_size) {
> +		struct packed_field_elem elem = {};
> +
> +		get_field_contents(data_ptr, f->type, &elem);
> +
> +		if (elem.startbit < elem.endbit)
> +			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") must be larger than endbit (%" PRIu64 ")\n",
> +			      f->name, f->mod->name, count, elem.startbit,
> +			      elem.endbit);
> +
> +		if (elem.startbit >= BITS_PER_BYTE * f->buffer_size)
> +			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") puts field outsize of the packed buffer size (%" PRIu64 ")\n",
> +			      f->name, f->mod->name, count, elem.startbit,
> +			      f->buffer_size);
> +
> +		if (elem.startbit - elem.endbit >= BITS_PER_BYTE * elem.size)
> +			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") and endbit (%" PRIu64 ") indicate a field of width (%" PRIu64 ") which does not fit into the field size (%" PRIu64 ")\n",
> +			      f->name, f->mod->name, count, elem.startbit,
> +			      elem.endbit, elem.startbit - elem.endbit,
> +			      elem.size);

elem.size is in bytes but the field width is in bits. The error message
is confusing because it's not clear what is wrong.

> +
> +		if (elem.size != 1 && elem.size != 2 && elem.size != 4 && elem.size != 8)
> +			error("\"%s\" [%s.ko] element %u size (%" PRIu64 ") must be 1, 2, 4, or 8\n",
> +			      f->name, f->mod->name, count, elem.size);
> +
> +		switch (order) {
> +		case FIRST_ELEMENT:
> +			order = SECOND_ELEMENT;
> +			break;
> +		case SECOND_ELEMENT:
> +			order = previous_elem.startbit < elem.startbit ?
> +				ASCENDING_ORDER : DESCENDING_ORDER;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		switch (order) {
> +		case ASCENDING_ORDER:

I don't see why ASCENDING_ORDER and DESCENDING_ORDER are handled as part
of a different switch/case statement.

> +			if (previous_elem.startbit >= elem.startbit)
> +				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element startbit is %" PRIu64 "\n",
> +				      f->name, f->mod->name, count,
> +				      elem.startbit, previous_elem.startbit);
> +			if (previous_elem.endbit >= elem.endbit)
> +				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element endbit is %" PRIu64 "\n",
> +				      f->name, f->mod->name, count, elem.endbit,
> +				      previous_elem.endbit);
> +
> +			break;
> +		case DESCENDING_ORDER:
> +			if (previous_elem.startbit <= elem.startbit)
> +				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in descending order, but previous element startbit is %" PRIu64 "\n",
> +				      f->name, f->mod->name, count,
> +				      elem.startbit, previous_elem.startbit);
> +			if (previous_elem.endbit <= elem.endbit)
> +				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in descending order, but previous element endbit is %" PRIu64 "\n",
> +				      f->name, f->mod->name, count,
> +				      elem.endbit, previous_elem.endbit);
> +			break;

The end goal was never to enforce ascending or descending order of the
start and end of the fields. The point was to enforce that the fields do
not overlap, which this does _not_ do. The rule for detecting overlap of
intervals [a, b] and [c, d] is that max(a, c) <= min(b, d).

Enforcing ascending/descending order is just a way of reducing the
complexity of the overlap check from O(n^2) to O(n). But the overlap
check itself is missing.

> +		default:
> +			break;
> +		}
> +
> +		previous_elem = elem;
> +		data_ptr += field_size;
> +		count++;
> +	}
> +}
> +
> +void check_packed_field_symbols(void)
> +{
> +	struct field_symbol *f;
> +
> +	hash_for_each(field_hashtable, f, hnode)
> +		check_packed_field_array(f);
> +}

