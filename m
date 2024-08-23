Return-Path: <linux-kbuild+bounces-3179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C395D3C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 18:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D4028522F
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 16:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE69188597;
	Fri, 23 Aug 2024 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GIQRBdnK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA8189B93
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2024 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724432018; cv=none; b=D7dg86mG1LnVuOoTWsjFadtq4sZ6fFrFv6cvn9rI0SLJbd5fSpE7Bt8F/44j/PZ8Hm5OoZZxyZgIZPY4/X4DvMfIl7yDLVDIYWwmSIiBypcLuNpIMie8g0YOYNhm5qnm8THiYMDJSZFEhA2r1rOL8QEwRU3mci0h2aUju9bLpHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724432018; c=relaxed/simple;
	bh=aDkpA7sHahzJz4O9pRbiLPc1/ZZRyODcWl1oN47eeaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFMriHoE2rdcQsze6bPoqHTGI4UAmocmYX6FFYn8Z98ky5nK7Woi3pBbaw7cSEfCJJNLSlZ31pJ021dNogWYrJ3cdjeSWRqA/qwfYZfGBOFcNIXu4mgL/RGVGsuK1Kx3crsjyJLe4DUrvPicrwWYB/zalRGdNF/WgwFSV9unyCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GIQRBdnK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-201fed75b38so3255ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2024 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724432015; x=1725036815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P9vuB8hri5qT5waMZfq5Z57S5cjCFURsSroxNeC6uFQ=;
        b=GIQRBdnKjWLO8NZRXd4rPBJAyQlTM03PH68eiSIHsTjzD+G5iGqRsC2n4p8wUzHrJk
         6Kft7nS6zjObwTLPotD9xGN3Ui3WOT0wNAw+Lc0V/JIonTqF1DcR7qyuY8cqKVnXuQKx
         T2bPuVdDkLUWKn2KSLGUrhgp1m3ZEauSNGx5n0cz2qVRhOIvuL7FxRL75jooefqYrITO
         iusgdNojqs8tYVM4owqLhCaw4d4CJl2mCF51uEIiFRfXQtRbfTEeW0HecQvFPKqfrIsj
         B5pwddchk8Ha/PoFLoMuvhzJ2c/HUZpo0PThI2E6NdVlk0pZ/ePP9RApvUqiXWd1cicZ
         fJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432015; x=1725036815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9vuB8hri5qT5waMZfq5Z57S5cjCFURsSroxNeC6uFQ=;
        b=uklaVg9TfuojpAVe09tXC6kQBXoR9S2tTtPpai4Xc5kQaAry+Q9n3nDU9PCXXhkYNO
         uEzac5IXfvzuER38hfAb/rG7IsIPeXGEEcc5oDRh0lYBxBkwC8CdTEWCdQo/EMoTZNit
         96A67NQNIOOok8pj0OMaeOg2xeE/yZuPyTjS06tmAQy8uT28I94/TyC8d3Zd8tzdkXn/
         +BTfvVzrvbc5yureNm0SlYAd2BcknB/wbkG1EkicCUg+6al2hmm9hR2mpfIJkFW/bfqX
         eY5R3//3vGfCKXT6KlkXeH+LcYSXIACO/PGes1zMPDUkgJypouL/U9L3mboLpYwQofWq
         /YDg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ScAqGnRvcmq2V19lUJmjleeQsVnGT+4Jcm+bpQd18cjIpzXYPbdL7ZAFnD7ZaZ2av/xS1uBpoVh3g4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQifx7XDsD/Kmh18ZNFCzEoCfGDXiXcB6PPOMxU87HqfXQHM5r
	BvP0pnsdiCi2W3j2UBEdGiF67CZ1nbsTCNGEUcLt1tNchQ4+4wTnaEt8NfkIdQ==
X-Google-Smtp-Source: AGHT+IFANpB3IAM/PQyhB7gp4T27UHfGZDu+u0nU1K65J/w+iVbYyN/ffreaJCEYq84wnORw5ooKPQ==
X-Received: by 2002:a17:902:e84f:b0:201:cdd1:b65d with SMTP id d9443c01a7336-2039a253467mr3509205ad.28.1724432015199;
        Fri, 23 Aug 2024 09:53:35 -0700 (PDT)
Received: from google.com (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613b2048fsm4349250a91.54.2024.08.23.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:53:34 -0700 (PDT)
Date: Fri, 23 Aug 2024 16:53:29 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Nick Alcock <nick.alcock@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jiri Olsa <olsajiri@gmail.com>,
	Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v8 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <20240823165329.GA3911831@google.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-3-kris.van.hees@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822181942.2626536-3-kris.van.hees@oracle.com>

Hi Kris,

On Thu, Aug 22, 2024 at 02:19:39PM -0400, Kris Van Hees wrote:
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> new file mode 100755
> index 000000000000..68df05fd3036
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,505 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# generate_builtin_ranges.awk: Generate address range data for builtin modules
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> +#		vmlinux.o.map > modules.builtin.ranges
> +#
> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, s) {
> +	if (fn in omod)
> +		return omod[fn];
> +
> +	if (match(fn, /\/[^/]+$/) == 0)
> +		return "";
> +
> +	obj = fn;
> +	mod = "";
> +	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +	if (getline s <fn == 1) {
> +		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> +			mod = substr(s, RSTART + 16, RLENGTH - 16);
> +			gsub(/['"]/, "", mod);
> +		}
> +	}

This doesn't work with built-in Rust modules because there's no
-DKBUILD_MODFILE flag passed to the compiler. The .cmd files do have
RUST_MODFILE set though, so presumably you could match that too?

Sami

