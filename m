Return-Path: <linux-kbuild+bounces-719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC68412E8
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 20:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E181284235
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 19:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337031755;
	Mon, 29 Jan 2024 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zfeerdiw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89557101CF
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 19:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706554827; cv=none; b=oq5dgnXA4fyIkubiKTHqbY5xnLyERkOcD27FjWdHMGqWtPMm2flJgdX76fpLvl0zQl/pijaRe7kpdnkKhDOnj/WocloOD5jXAt37o5CAqZQ/yWkNb/wgdrKBpT/m6xc8GFxZ+HJEYrWo2joZrNVcir7JYbjpL7jAxQ0xPDmUyEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706554827; c=relaxed/simple;
	bh=ssMtgarRnRs+LWFQuEr18d3XaNBa10XeJKStTgVMzZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URTzA1aKOUdeyGvnVphWRixbJSkrCE+3ItBcKoB3ZyBVFUpOQUl9SiveJ8Resqdh8F25LSOnfVSLH83V9ZLjp35D7duxeZcgnPn5X6fzboYEwKQIBarDN2mQ9tmu1ku4Fszlq/7Zv2nFz2G14/Db0r9t9XU6ihmt5htOUgPSzf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zfeerdiw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ef9382752so7835e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 11:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706554810; x=1707159610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYJPquRBqD9Q7jzpQNCrCFu5Gx3v6qV+tI8wEy5zyow=;
        b=ZfeerdiwfxWViMskYXJhB+YweyCBokktAl4Zyr9iMcfE7BpBFSGXKdo1O0zSn1V9gv
         ufODj1TKQLdH4T7l2Lll6fPA+bmKijB930YahEfHDIqJnB/24Nt+96Id7kywbe/eJ2Q1
         M3xvL0T/xWV/Fjk8g8e+/ADMXDPeg0ZqXjCU1fz788w0mpdXlyuBgN76hTkCgsrg8TY+
         y6K85VlVkiWgTSm1HjrX9p0RN3RewVKeiG1+2yXqh9Cg+jpwyHieHEa1aJU/gqmsCXUe
         v0lkDrm+jh3jw8aWyuEgvLtrv3I3DA1E3VxraSdXbLPeVc7LI/0rn7UD2BehOkkGQRyf
         Enjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706554810; x=1707159610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYJPquRBqD9Q7jzpQNCrCFu5Gx3v6qV+tI8wEy5zyow=;
        b=LON2BN5Dy6BbY0ztu3k8vqg5NDLG5xneO+6owLGDrBb6CfLDqluWLi+8Wq83sbUFfn
         w8y6DZgFYOgPxgcv8OUE2mOD3U1nYNF/XfyaSrB7OCfWzuXRSJG2SlurXciAffgSuHUQ
         MNX1k6Uw4z2du9Bz2z8aAaRuqCOSt09h7L6G+LkqQKH6UtqvdHBObT+bFVI69eB+a6Yn
         h9ESRlKReTYgU44KC8scSC1ah4gB37rgGo6HJv7VZzit7oFg+pRwjwEB4W2Yo4TU+IwJ
         J/hMOMWc5myQhJOcIPHUhvDylKujF48dVssHnFWNhJnZGyAgS2tUvMd52L3nlWl7EhdZ
         /FbQ==
X-Gm-Message-State: AOJu0YxsLDrWKFjA/c4XAzteS2NdflkfXoYAUkrq7dmU383UwLUd5P39
	CfiS5nCtS7xuQiK7WffskUF3bcJgmEDXKDlpJqh9uE9s5R45+AkK3s/UweOM2Yai1kFpx1QnSad
	LXDcQHmuENNL5hb4DUaZfsRPjZBrBL7eOqwmZ
X-Google-Smtp-Source: AGHT+IEFMiDR4T+Az5QhHWjBGq7ivQjiq8VZP7xtdBES4S/LvDRFYd/o733yPgW6mWJ0oHxcB5Iolmk0/4LYRKcEnzI=
X-Received: by 2002:a05:600c:c12:b0:40d:839b:7844 with SMTP id
 fm18-20020a05600c0c1200b0040d839b7844mr14670wmb.6.1706554809639; Mon, 29 Jan
 2024 11:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129175033.work.813-kees@kernel.org> <20240129180046.3774731-1-keescook@chromium.org>
In-Reply-To: <20240129180046.3774731-1-keescook@chromium.org>
From: Fangrui Song <maskray@google.com>
Date: Mon, 29 Jan 2024 10:59:55 -0800
Message-ID: <CAFP8O3LhmXqqKKf1fOw1_0zGYOyN7ivm2yYSQJqSQr_megOq8Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] ubsan: Use Clang's -fsanitize-trap=undefined option
To: Kees Cook <keescook@chromium.org>
Cc: Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Andrey Konovalov <andreyknvl@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 10:00=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> Clang changed the way it enables UBSan trapping mode. Update the Makefile
> logic to discover it.
>
> Suggested-by: Fangrui Song <maskray@google.com>
> Link: https://lore.kernel.org/lkml/CAFP8O3JivZh+AAV7N90Nk7U2BHRNST6MRP0zH=
tfQ-Vj0m4+pDA@mail.gmail.com/
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  scripts/Makefile.ubsan | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 4749865c1b2c..7cf42231042b 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -10,6 +10,6 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)         +=3D -fsa=
nitize=3Dinteger-divide-by-zero
>  ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)       +=3D -fsanitize=3Dunreach=
able
>  ubsan-cflags-$(CONFIG_UBSAN_BOOL)              +=3D -fsanitize=3Dbool
>  ubsan-cflags-$(CONFIG_UBSAN_ENUM)              +=3D -fsanitize=3Denum
> -ubsan-cflags-$(CONFIG_UBSAN_TRAP)              +=3D -fsanitize-undefined=
-trap-on-error
> +ubsan-cflags-$(CONFIG_UBSAN_TRAP)              +=3D $(call cc-option,-fs=
anitize-trap=3Dundefined,-fsanitize-undefined-trap-on-error)
>
>  export CFLAGS_UBSAN :=3D $(ubsan-cflags-y)
> --
> 2.34.1

Thanks for the patch. Clang has had -fsanitize-trap=3D since 2015.
GCC added -fsanitize-trap=3Dundefined in 2022
(https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D2c7cfc7b418564 ;
milestone: 13.1), so we cannot use -fsanitize-trap=3Dundefined
unconditionally.

Reviewed-by: Fangrui Song <maskray@google.com>




--
=E5=AE=8B=E6=96=B9=E7=9D=BF

