Return-Path: <linux-kbuild+bounces-4577-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935C9C24E6
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 19:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83D8C1C22109
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 18:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8519C194082;
	Fri,  8 Nov 2024 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FblZq8f/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC46233D93;
	Fri,  8 Nov 2024 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090671; cv=none; b=ZrIHv9+bB8qTAhI2tDjHw/3qy243IzrwlqIShDFxHwBwg7PAVavv/ibntJOUCwzFssesN5kcLSJayB22xPY+aBEaHXK04KmKLcTEz2BdaRAF7w2/vWGjMS9TzDX8UvvWkD8GXr2YZLRswNEkQzbS+Q3RemHhxa+BWagXjtTJa9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090671; c=relaxed/simple;
	bh=LZ7ljfeQMGMMWIqGTh65v9JsEy3c90QhUqhXvd28FJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6K84Qkx5CBc6YhkIB1L1Q4HpuIlN6hptzULjuT7EjLzEZIZ7oPgYmt4awsG/n7Jqi5URkd/APYEr6gmnm0c9UYV0BJWPIHyHg9lCGlOYOzTO+x867gWULQnPm2P6va5tYtWYwlKW3bf/6gJ2Bb1i8PBKNGs9XC2q0nijwclvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FblZq8f/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43152fa76aaso2172585e9.1;
        Fri, 08 Nov 2024 10:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731090667; x=1731695467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4uAWB2+qt2uLQC0gJQS7ShAnT+5jz6ssEiqshxsOsw=;
        b=FblZq8f/AbAq0DkiVk0eh0se+OhnTT7gvGq7t2uM+wdj6goDR90iRVhAASQUN4sNnk
         EVXcNZ/6AqOajJ/cWLqH6toLn1XjJ2C9LiBDRKUSxD9mSwkUO5DUhByj/wxQusPzOBiP
         p03toVTz2y9W5d0pWp/qyIqVYPNp06Z/yxvAdKzRlV3y9di1Oz/ViUGoRkGwvwsAuCe2
         cOGYBB57AMhi4jGrQl6Hzacx02A+ROTouf4ZqIIfEBbn+XIWgi0hyotroyYEQDoQGxSA
         C+HGTGGgO7Oc7Nm0z5RYAdlfA4pwpnYWHp7Ot7ApsfthtzATOs7S39/+uMOg1OhoHbzJ
         DrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731090667; x=1731695467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4uAWB2+qt2uLQC0gJQS7ShAnT+5jz6ssEiqshxsOsw=;
        b=AvZeWWrITt8sRiiR6JAlKCsYWGtc46qxY3J7gXgm8X14876nkgJANwy7q9EbaM3RpW
         QL7omysrT+1icWDA1XGHSp0BUzgLne+vaCvVzlNa7NmuKk8CAelh19446+ucQseHASa/
         kzhVoLibML3mNqwu4h0D8yp/jx3kdjLQLTe0IIQOShIqkbBfr8Z1bENlXGs4mGSCi3UI
         m6TO6defMHPeHWw/K0DxHS7aWF6TUNL/jXpSOPJURjCF+qulPTtwSB+qK7c/mvdNCzr7
         bpJ0AXlbDC9ykwRqu/NzhXxv8RaTbaNHzH/oJzIf0bVfhtx8OJom2DRtQq/reOugbFNf
         fUAg==
X-Forwarded-Encrypted: i=1; AJvYcCVROP3kukhr6k5uA3VIlrOa+wyNL/kyyLw4LUB3Iyn4ovB0Hk8jV4kmWtn5IS0H25HXAB2Zz7Oy@vger.kernel.org, AJvYcCVh8f34nQpctv2EBCsjaZScj01dQGNTK7Q/05tRvbOlXqfVQdDUtgWpzL+YCRNBZpDMpr5zUvZpg1fGD4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMOWF1K7iXk3CTrFPjwMx/jph2EWE32AolXSWw/8mVGljyCWX
	m4haxPL9iSSWHxS8MydYENX1SHcaveaM+ZmwJcKA6W5K+m1ewWmw
X-Google-Smtp-Source: AGHT+IH8J44AuBTs2/4IWBD2Rn1YwgNp0rKCOEWk0/kLTBifsZZupuHQWhkahp6jmBv2YZwR9Gapsw==
X-Received: by 2002:a05:600c:3c99:b0:42c:bfd6:9d1f with SMTP id 5b1f17b1804b1-432b74feca1mr16463875e9.1.1731090667279;
        Fri, 08 Nov 2024 10:31:07 -0800 (PST)
Received: from skbuf ([188.25.106.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6c1205sm119184535e9.26.2024.11.08.10.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 10:31:06 -0800 (PST)
Date: Fri, 8 Nov 2024 20:31:04 +0200
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
Message-ID: <20241108183104.wfzvav42zgslqofy@skbuf>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
 <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>
 <20241108112407.3mg2aspg5h2vas4c@skbuf>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fltu2m6lconhnghk"
Content-Disposition: inline
In-Reply-To: <20241108112407.3mg2aspg5h2vas4c@skbuf>


--fltu2m6lconhnghk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 01:24:07PM +0200, Vladimir Oltean wrote:
> On Thu, Nov 07, 2024 at 11:50:34AM -0800, Jacob Keller wrote:
> > +#define DECLARE_PACKED_FIELDS_S(name, buffer_sz) \
> > +	const size_t __ ## name ## _buffer_sz __pf_section_s = buffer_sz; \
> > +	const struct packed_field_s name[] __pf_section_s
> 
> This will need sorting out - how to make this declaration macro
> compatible with the "static" keyword. The obvious way (to group the
> field array and the buffer size into a structure) doesn't work. It loses
> the ARRAY_SIZE() of the fields, which is important to the pack_fields()
> and unpack_fields() wrappers.
> 
> Maybe a different tool is needed for checking that no packed fields
> exceed the buffer size? Forcing the buffer size be a symbol just because
> that's what modpost works with seems unnatural.
> 
> If we knew the position of the largest field array element in C, and if
> we enforced that all pack_fields() use a strong type (size included) for
> the packed buffer, we'd have all information inside the pack_fields()
> macro, because we only need to compare the largest field against the
> buffer size. We could just have that part as a BUILD_BUG_ON() wrapped
> inside the pack_fields() macro itself. And have the compile-time checks
> spill over between C and modpost...
> 
> Not to mention, pack_fields() would have one argument less: pbuflen.

I was thinking something like this (attached). I still don't like
modpost more than the assertions in C code, because it imposes more
constraints upon the library user which didn't exist before. Though
without the extra restrictions added in this patch (just ascending order
for packed fields + strong type for packed buffer), I don't think the
modpost variant is going to work, or is going to become extremely complex.

--fltu2m6lconhnghk
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-pack_fields-changes.patch"

From d9bf88a24518afa96fe55beda040a3605b81610a Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Fri, 8 Nov 2024 17:07:16 +0200
Subject: [PATCH] pack_fields() changes

Remove ability to declare packed field array in ascending and descending
order, over just ascending.

Actually implement the overlap check in modpost. The simple check:
"elem.endbit <= previous_elem.startbit" enforces both ascending order
and non-overlapping checks.

Move the check that fields don't exceed the buffer size inside the
pack_fields() and unpack_fields() macro. With the assumption that the
packed field array is sorted (enforced by modpost), we only need to
check this for the last element of the array.

Remove the packed buffer size from the DECLARE_PACKED_FIELDS_*() macros,
and thus from the .rodata.packed_fields_* sections. Also remove the
modpost code that looks for those sizes.

Modify the pack_fields() API to always expect a strong type as the
"pbuf" argument, because we take sizeof(*pbuf) as the packed buffer
size. Remove the pbuflen from the required argument list, and adapt ice
accordingly.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/intel/ice/ice_common.c |  16 +--
 include/linux/packing.h                     |  32 +++--
 include/linux/packing_types.h               |  15 +-
 scripts/mod/packed_fields.c                 | 148 ++++++--------------
 4 files changed, 76 insertions(+), 135 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 98845d790791..631963427082 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1381,7 +1381,7 @@ static void ice_copy_rxq_ctx_to_hw(struct ice_hw *hw,
 	PACKED_FIELD((lsb) + (width) - 1, (lsb), struct struct_name, struct_field)
 
 /* LAN Rx Queue Context */
-DECLARE_PACKED_FIELDS_S(ice_rlan_ctx_fields, ICE_RXQ_CTX_SZ) = {
+static const DECLARE_PACKED_FIELDS_S(ice_rlan_ctx_fields) = {
 				 /* Field		Width	LSB */
 	ICE_CTX_STORE(ice_rlan_ctx, head,		13,	0),
 	ICE_CTX_STORE(ice_rlan_ctx, cpuid,		8,	13),
@@ -1416,10 +1416,8 @@ DECLARE_PACKED_FIELDS_S(ice_rlan_ctx_fields, ICE_RXQ_CTX_SZ) = {
 static void ice_pack_rxq_ctx(const struct ice_rlan_ctx *ctx,
 			     ice_rxq_ctx_buf_t *buf)
 {
-	BUILD_BUG_ON(sizeof(*buf) != ICE_RXQ_CTX_SZ);
-
-	pack_fields(buf, sizeof(*buf), ctx, ice_rlan_ctx_fields,
-		    QUIRK_LITTLE_ENDIAN | QUIRK_LSW32_IS_FIRST);
+	pack_fields(buf, ctx, ice_rlan_ctx_fields, QUIRK_LITTLE_ENDIAN |
+		    QUIRK_LSW32_IS_FIRST);
 }
 
 /**
@@ -1448,7 +1446,7 @@ int ice_write_rxq_ctx(struct ice_hw *hw, struct ice_rlan_ctx *rlan_ctx,
 }
 
 /* LAN Tx Queue Context */
-DECLARE_PACKED_FIELDS_S(ice_tlan_ctx_fields, ICE_TXQ_CTX_SZ) = {
+static const DECLARE_PACKED_FIELDS_S(ice_tlan_ctx_fields) = {
 				    /* Field			Width	LSB */
 	ICE_CTX_STORE(ice_tlan_ctx, base,			57,	0),
 	ICE_CTX_STORE(ice_tlan_ctx, port_num,			3,	57),
@@ -1489,10 +1487,8 @@ DECLARE_PACKED_FIELDS_S(ice_tlan_ctx_fields, ICE_TXQ_CTX_SZ) = {
  */
 void ice_pack_txq_ctx(const struct ice_tlan_ctx *ctx, ice_txq_ctx_buf_t *buf)
 {
-	BUILD_BUG_ON(sizeof(*buf) != ICE_TXQ_CTX_SZ);
-
-	pack_fields(buf, sizeof(*buf), ctx, ice_tlan_ctx_fields,
-		    QUIRK_LITTLE_ENDIAN | QUIRK_LSW32_IS_FIRST);
+	pack_fields(buf, ctx, ice_tlan_ctx_fields, QUIRK_LITTLE_ENDIAN |
+		    QUIRK_LSW32_IS_FIRST);
 }
 
 /* Sideband Queue command wrappers */
diff --git a/include/linux/packing.h b/include/linux/packing.h
index b66c4809e121..d4988131e13a 100644
--- a/include/linux/packing.h
+++ b/include/linux/packing.h
@@ -35,16 +35,26 @@ void unpack_fields_m(const void *pbuf, size_t pbuflen, void *ustruct,
 		     const struct packed_field_m *fields, size_t num_fields,
 		     u8 quirks);
 
-#define pack_fields(pbuf, pbuflen, ustruct, fields, quirks) \
-	_Generic((fields), \
-		 const struct packed_field_s * : pack_fields_s, \
-		 const struct packed_field_m * : pack_fields_m \
-		)(pbuf, pbuflen, ustruct, fields, ARRAY_SIZE(fields), quirks)
-
-#define unpack_fields(pbuf, pbuflen, ustruct, fields, quirks) \
-	_Generic((fields), \
-		 const struct packed_field_s * : unpack_fields_s, \
-		 const struct packed_field_m * : unpack_fields_m \
-		)(pbuf, pbuflen, ustruct, fields, ARRAY_SIZE(fields), quirks)
+#define pack_fields(pbuf, ustruct, fields, quirks) \
+	({ typeof(fields[0]) *__f = fields; \
+	   size_t pbuflen = sizeof(*pbuf); \
+	   size_t num_fields = ARRAY_SIZE(fields); \
+	   BUILD_BUG_ON(__f[num_fields - 1].startbit >= BITS_PER_BYTE * pbuflen); \
+	   _Generic(__f, \
+		    const struct packed_field_s * : pack_fields_s, \
+		    const struct packed_field_m * : pack_fields_m \
+		   )(pbuf, pbuflen, ustruct, __f, num_fields, quirks); \
+	})
+
+#define unpack_fields(pbuf, ustruct, fields, quirks) \
+	({ typeof(fields[0]) *__f = fields; \
+	   size_t pbuflen = sizeof(*pbuf); \
+	   size_t num_fields = ARRAY_SIZE(fields); \
+	   BUILD_BUG_ON(__f[num_fields - 1].startbit >= BITS_PER_BYTE * pbuflen); \
+	   _Generic(__f, \
+		    const struct packed_field_s * : unpack_fields_s, \
+		    const struct packed_field_m * : unpack_fields_m \
+		   )(pbuf, pbuflen, ustruct, __f, num_fields, quirks); \
+	})
 
 #endif
diff --git a/include/linux/packing_types.h b/include/linux/packing_types.h
index 49ae4329a494..c761d93be235 100644
--- a/include/linux/packing_types.h
+++ b/include/linux/packing_types.h
@@ -24,12 +24,6 @@ struct packed_field_s {
 	GEN_PACKED_FIELD_MEMBERS(u8);
 };
 
-#define __pf_section_s __section(".rodata.packed_fields_s")
-
-#define DECLARE_PACKED_FIELDS_S(name, buffer_sz) \
-	const size_t __ ## name ## _buffer_sz __pf_section_s = buffer_sz; \
-	const struct packed_field_s name[] __pf_section_s
-
 /* Medium packed field. Use with bit offsets < 65536, buffers < 8KB and
  * unpacked structures < 64KB.
  */
@@ -37,11 +31,10 @@ struct packed_field_m {
 	GEN_PACKED_FIELD_MEMBERS(u16);
 };
 
-#define __pf_section_m __section(".rodata.packed_fields_m")
-
-#define DECLARE_PACKED_FIELDS_M(name, buffer_sz) \
-	const size_t __ ## name ## _buffer_sz __pf_section_m = buffer_sz; \
-	const struct packed_field_m name[] __pf_section_m
+#define DECLARE_PACKED_FIELDS_S(name) \
+	struct packed_field_s name[] __section(".rodata.packed_fields_s")
+#define DECLARE_PACKED_FIELDS_M(name) \
+	struct packed_field_m name[] __section(".rodata.packed_fields_m")
 
 #define PACKED_FIELD(start, end, struct_name, struct_field) \
 { \
diff --git a/scripts/mod/packed_fields.c b/scripts/mod/packed_fields.c
index aa9dbd704e52..5927b0c7f404 100644
--- a/scripts/mod/packed_fields.c
+++ b/scripts/mod/packed_fields.c
@@ -87,18 +87,18 @@ struct field_symbol {
 	size_t data_size;
 	void *data;
 	struct module *mod;
-	char *name;
+	const char *name;
 };
 
 static HASHTABLE_DEFINE(field_hashtable, 1U << 10);
 
-static struct field_symbol *alloc_field(char *name, struct module *mod)
+static struct field_symbol *alloc_field(const char *name, struct module *mod)
 {
 	struct field_symbol *f = xmalloc(sizeof(*f));
 
 	memset(f, 0, sizeof(*f));
 	f->mod = mod;
-	f->name = name;
+	f->name = xstrdup(name);
 
 	return f;
 }
@@ -124,10 +124,8 @@ void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
 {
 	unsigned int secindex = get_secindex(info, sym);
 	enum field_type type = UNKNOWN_SECTION;
-	bool is_size_symbol = false;
 	struct field_symbol *f;
 	const char *section;
-	char *name;
 
 	/* Skip symbols without a name */
 	if (*symname == '\0')
@@ -148,18 +146,9 @@ void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
 	if (type == UNKNOWN_SECTION)
 		return;
 
-	name = xstrdup(symname);
-
-	/* Extract original field name from the size symbol */
-	if (!fnmatch("__*_buffer_sz", name, 0)) {
-		name += strlen("__");
-		name[strlen(name) - strlen("_buffer_sz")] = '\0';
-		is_size_symbol = true;
-	}
-
-	f = find_field(name, mod);
+	f = find_field(symname, mod);
 	if (!f) {
-		f = alloc_field(name, mod);
+		f = alloc_field(symname, mod);
 		f->type = type;
 		hash_add_field(f);
 	}
@@ -170,118 +159,71 @@ void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
 		return;
 	}
 
-	if (is_size_symbol) {
-		size_t *size_data = sym_get_data(info, sym);
-		size_t size = TO_NATIVE(*size_data);
-
-		if (f->buffer_size && f->buffer_size != size) {
-			error("%s has buffer size %zu, but symbol %s says the size should be %zu\n",
-			      f->name, f->buffer_size, symname, size);
-		}
-
-		f->buffer_size = size;
-	} else {
-		if (f->data)
-			error("%s has multiple data symbols???\n",
-			      f->name);
-
-		f->data_size = sym->st_size;
-		f->data = xmalloc(f->data_size);
-		memcpy(f->data, sym_get_data(info, sym), f->data_size);
+	if (f->data) {
+		error("%s has multiple data symbols???\n",
+		      f->name);
 	}
-}
 
-enum element_order {
-	FIRST_ELEMENT,
-	SECOND_ELEMENT,
-	ASCENDING_ORDER,
-	DESCENDING_ORDER,
-};
+	f->data_size = sym->st_size;
+	f->data = xmalloc(f->data_size);
+	memcpy(f->data, sym_get_data(info, sym), f->data_size);
+}
 
 static void check_packed_field_array(const struct field_symbol *f)
 {
-	struct packed_field_elem previous_elem = {};
 	size_t field_size = field_type_to_size(f->type);
-	enum element_order order = FIRST_ELEMENT;
+	struct packed_field_elem previous_elem = {};
 	void *data_ptr;
-	int count;
+	size_t count;
 
 	/* check that the data is a multiple of the size */
-	if (f->data_size % field_size != 0) {
-		error("symbol %s of module %s has size %zu which is not a multiple of the field size (%zu)\n",
-		      f->name, f->mod->name, f->data_size, field_size);
+	if (f->data_size % field_size) {
+		error("[%s] symbol %s has size %zu which is not a multiple of the field size (%zu)\n",
+		      f->mod->name, f->name, f->data_size, field_size);
 		return;
 	}
 
-	data_ptr = f->data;
-	count = 0;
-
-	while (data_ptr < f->data + f->data_size) {
+	for (data_ptr = f->data, count = 0;
+	     data_ptr < f->data + f->data_size;
+	     data_ptr += field_size, count++) {
 		struct packed_field_elem elem = {};
 
 		get_field_contents(data_ptr, f->type, &elem);
 
-		if (elem.startbit < elem.endbit)
-			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") must be larger than endbit (%" PRIu64 ")\n",
-			      f->name, f->mod->name, count, elem.startbit,
-			      elem.endbit);
+		if (elem.size != 1 && elem.size != 2 &&
+		    elem.size != 4 && elem.size != 8) {
+			error("[%s] \"%s\" field %zu unpacked size (%" PRIu64
+			      ") must be 1, 2, 4, or 8 bytes\n",
+			      f->mod->name, f->name, count, elem.size);
+		}
 
-		if (elem.startbit >= BITS_PER_BYTE * f->buffer_size)
-			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") puts field outsize of the packed buffer size (%" PRIu64 ")\n",
-			      f->name, f->mod->name, count, elem.startbit,
-			      f->buffer_size);
+		if (elem.startbit < elem.endbit) {
+			error("[%s] \"%s\" field %zu (%" PRIu64 "-%" PRIu64
+			      "): start bit must be >= end bit\n",
+			      f->mod->name, f->name, count, elem.startbit,
+			      elem.endbit);
+		}
 
-		if (elem.startbit - elem.endbit >= BITS_PER_BYTE * elem.size)
-			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") and endbit (%" PRIu64 ") indicate a field of width (%" PRIu64 ") which does not fit into the field size (%" PRIu64 ")\n",
-			      f->name, f->mod->name, count, elem.startbit,
+		if (elem.startbit - elem.endbit >= BITS_PER_BYTE * elem.size) {
+			error("[%s] \"%s\" field %zu (%" PRIu64 "-%" PRIu64
+			      ") has a width of %" PRIu64
+			      " which does not fit into the unpacked structure field (%"
+			      PRIu64 " bytes)\n",
+			      f->mod->name, f->name, count, elem.startbit,
 			      elem.endbit, elem.startbit - elem.endbit,
 			      elem.size);
-
-		if (elem.size != 1 && elem.size != 2 && elem.size != 4 && elem.size != 8)
-			error("\"%s\" [%s.ko] element %u size (%" PRIu64 ") must be 1, 2, 4, or 8\n",
-			      f->name, f->mod->name, count, elem.size);
-
-		switch (order) {
-		case FIRST_ELEMENT:
-			order = SECOND_ELEMENT;
-			break;
-		case SECOND_ELEMENT:
-			order = previous_elem.startbit < elem.startbit ?
-				ASCENDING_ORDER : DESCENDING_ORDER;
-			break;
-		default:
-			break;
 		}
 
-		switch (order) {
-		case ASCENDING_ORDER:
-			if (previous_elem.startbit >= elem.startbit)
-				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element startbit is %" PRIu64 "\n",
-				      f->name, f->mod->name, count,
-				      elem.startbit, previous_elem.startbit);
-			if (previous_elem.endbit >= elem.endbit)
-				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element endbit is %" PRIu64 "\n",
-				      f->name, f->mod->name, count, elem.endbit,
-				      previous_elem.endbit);
-
-			break;
-		case DESCENDING_ORDER:
-			if (previous_elem.startbit <= elem.startbit)
-				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in descending order, but previous element startbit is %" PRIu64 "\n",
-				      f->name, f->mod->name, count,
-				      elem.startbit, previous_elem.startbit);
-			if (previous_elem.endbit <= elem.endbit)
-				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in descending order, but previous element endbit is %" PRIu64 "\n",
-				      f->name, f->mod->name, count,
-				      elem.endbit, previous_elem.endbit);
-			break;
-		default:
-			break;
+		if (count && elem.endbit <= previous_elem.startbit) {
+			error("[%s] \"%s\" field %zu (%" PRIu64 "-%" PRIu64
+			      ") overlaps with previous field (%" PRIu64 "-%" PRIu64
+			      ") or array is not declared in ascending order\n",
+			      f->mod->name, f->name, count, elem.startbit,
+			      elem.endbit, previous_elem.startbit,
+			      previous_elem.endbit);
 		}
 
 		previous_elem = elem;
-		data_ptr += field_size;
-		count++;
 	}
 }
 
-- 
2.43.0


--fltu2m6lconhnghk--

