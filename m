Return-Path: <linux-kbuild+bounces-10657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AF4D39AFC
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 23:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 187A6300B907
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 22:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5A75CDF1;
	Sun, 18 Jan 2026 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiNKT7sU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117371C5D5E
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768776400; cv=pass; b=JidehEPxVajCDl9YO4TKe41m3eSGmDWGuUya9LO5lVISaxUFfO/oJPqgifAWuVYRUhEgHiBpurCeiH5ICB40DFkLEquyK9hyDakvl87P4lGxJ+CrnJf3eMfI5UmKqD/fBHVOroEsSwf3TcNDXhGlNf9smoE3XMVwv/QjntuWFXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768776400; c=relaxed/simple;
	bh=2g/7cFlPY2ZAdPsMyWoE68vAlVX/dSFDy6oQHwex+sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+EmLovnpgekWOtST2K1u3zIqhU5+zCFgAMUZEdt/cw2xZGztFDH/BdiWHucRnR1Iqk0MnLxnYWsSo/GRrI8sqXzp/V3eRwW15ETfGC3RKkf2iS8FQ/JkDoERhNFiBdSboKRc4z6j6tL1rkhG+MpC4/e04+EEOHmMJWmt8oaouU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiNKT7sU; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ae60d8a05dso418596eec.2
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 14:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768776398; cv=none;
        d=google.com; s=arc-20240605;
        b=A6A3pzrJuwkGWb2NU7ofIeul8PukVfy/NX6e7rERI17NHvccsmKV/8zKWbLeM/fkFE
         vLdDRlkYVymU3r1hxTpVdYeREg8hQEZqmGdKyi7jANDxc1b6C9zByx6jIZX/vtyopX+E
         f4mHtn1pv9J1b/rNAXoM/0isQl/vNtrGLzLcUA4S0HtfT8VuDrgaI6ch2c7luLzy1rpE
         P6/D6hrd4kKEHyswJTpTgi4Omjef6R4OYiZlCSeX1h8XMuEqrsEFCjVNVsXXuYNPyI18
         88sqR+H8As/BjO6KdVbbRIkb5w4tEr5qU0a/Ykx1KeyFnQIiu5qDZlj8xit/22y/XNbV
         ZwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtVEsLC63/IRG9ePaQ4Wz532UEWlaB8YwqF2YosYYDk=;
        fh=h0YbpLLVzcdc8gbkgmbgHxFGDHdlxdgV+v0HNis1OrU=;
        b=H8vpCQmNUWcZQHiVCxH5TIRnFjKsijTpECWCJo400pgt4Pl3YodEBO2hwH8AHaag48
         zsUoP/S29zzniKfDCnvz+YjMIpgWM0vv1MmPCVob2LfT7+grFGuALdZem7BngMsa16PF
         jtWRyVzegzmTpx6kJ7eqccyKkXjsRHSw+fuIFTI4BOEn0D/mmjhLn/QhEMdMTzNv8Z7L
         i9uBHzH12HogGjV3Hgga74WSHrIUbU3AAcPoiZ1ZkmVQzv73ItxfVH3AYxT8gGlGwqD6
         yxBxbdkR1OxwYh+pCVGcAFh1jyBJJd79aeD1rfF/iNMlObFgbynMQ5URtz0qyJGkOAtC
         zRhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768776398; x=1769381198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtVEsLC63/IRG9ePaQ4Wz532UEWlaB8YwqF2YosYYDk=;
        b=RiNKT7sUt0UeJxtr9eAMht9VCrKQxQwvjkYqg+Nh+EbYjqdbFXEy5RFdOZLtYlL7P3
         tXtCh949D7x6+iVHHwyHcEczfLbRkvZtV0NAKl5Zj7TRa76H/4xfpm1SYn1lZMb6mx/1
         qMI3KdykDFWJdkkZyKN1BoeutmHCs3yInnJG0ieWD9cVmooCLIgU5A3SeGJhzay2jaru
         g6tkBAiZ4pA54ZnCrjBv2m3ZPGAgLMbYIWUISmhV+Rq+QJVl1BpPJp8k/kXSW5swbiuQ
         yufYPKVNBXGCSzWfIxIYSo58LXSpzBaDc1LVwzNj80Uop/iL/jnArEjMlP1r9z2WujU1
         nBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768776398; x=1769381198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtVEsLC63/IRG9ePaQ4Wz532UEWlaB8YwqF2YosYYDk=;
        b=LC4WpaWCkQ1OvZ12owhABLDdyhcPkajdmplRv+DxoDkDCTbW1xnyfGBM3Bsrf9eCnh
         Gp0iAPGTnFpq25d0oOZDZvA3O0UUP8nQRgItS5AnuZihmxiYTNjtHEejzfLrW7sLE7nh
         QWYaMS7bFmWYxBgU0GIGAGwM+DtX6OGgKHY2Sx70PohADXwshmelARY0MF2vH1uKGdtw
         Kzs/whaduX39D/m7gJmR0vG/EeSd94zxnYDwa+E86xKPYVOqDlBnjZ0cZllykOm25791
         M/VH/eTyGkbNdpwgyMkX+WsSoVwHdI4V6jPI9M/4X2ddBpWeuYstPXWg9EqpfA2Luv+e
         Iwvg==
X-Forwarded-Encrypted: i=1; AJvYcCU3BM8GVhLTZ//LGaI4rRp5a/dyH/xDDn0YUmb9NPFhcrKPtSwV7q5Vq0pPvcEXGEz+036PLBydks7H/WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxllPk1E+eWdqjucXXBDStEAZ5sKN5jqFNYcehIViNuZ82yUW8n
	BGs/4MyyG4zv4aRyy9BddLtOR3lUJiFVp9XSCwDvCHBDiW/18HsXcIkjWdcfDNvJ3dNO3U6HV7Y
	JhxsjdX10qcqgYXHH5W5f3FzBegfKYsk=
X-Gm-Gg: AY/fxX7xKo3173iZhhN7VH/5LOmuPqNjjhkQD2qtZVXyUsqM1fkuGxVykx4KZNwjZzS
	Ve+gbv6FOxtYgPVAsiBAhie/237qqGkqQg6QiLLKQ0pzzRDZGt71LhthyoWq8bYcpcixT2brqPa
	QKou8KErCt3u+Ioq6XhGPfkP0WHsGgye6An6Q2s1YKYHZC6596TbCkwCRejzPhA90YOJdOtBYtE
	s4sJcCWu8Ranb2DqwCzQb1DtDiaaQgguktQOiheAKIm1LRZBAc09X7VvZlyV9Fm7XLGXwqNZ+wA
	x6QS3DlaIsfyZi43tumdcXwWfXJp1wp920PY9zWGGZd3jbqPBezmxZg6F0XdI++D54hWV09gfwS
	Vqz9s8JVAMOnftc95QKKK0Wo=
X-Received: by 2002:a05:7300:f18f:b0:2a6:cb65:1974 with SMTP id
 5a478bee46e88-2b6b3ecafe4mr3840431eec.1.1768776398161; Sun, 18 Jan 2026
 14:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be>
In-Reply-To: <20251221081659.1742800-1-stijn@linux-ipv6.be>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:46:25 +0100
X-Gm-Features: AZwV_QgLttooLq08ae1MGIYSqi9xhNf1UwvXHTfzNO4Jj3FY48KQmYnqWrzcVhA
Message-ID: <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Emese Revfy <re.emese@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:17=E2=80=AFAM <stijn@linux-ipv6.be> wrote:
>
> When CONFIG_GCC_PLUGIN_LATENT_ENTROPY and CONFIG_RUST are enabled, rust
> bindgen fails due to latent_entropy being undeclared:
>
>   BINDGEN rust/bindings/bindings_generated.rs
> ./include/linux/random.h:24:39: error: use of undeclared identifier 'late=
nt_entropy'
> ./include/linux/random.h:24:62: error: use of undeclared identifier 'late=
nt_entropy'
> Unable to generate bindings: clang diagnosed error: ./include/linux/rando=
m.h:24:39: error: use of undeclared identifier 'latent_entropy'
> ./include/linux/random.h:24:62: error: use of undeclared identifier 'late=
nt_entropy'
>
> Fix this by adding DISABLE_LATENT_ENTROPY_PLUGIN to
> bindgen_extra_c_flags.
>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>

Cc'ing plugins and Kbuild.

Kees, Emese: from a quick look at the plugin, it doesn't seem to
change the signature of the functions (and even for variables it just
initializes), so it seems OK to ignore it for `bindgen` purposes, at
least naively. So I think this sounds fine.

Thanks!

Cheers,
Miguel

