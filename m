Return-Path: <linux-kbuild+bounces-1927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1F8CD919
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 19:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25928283566
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 17:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2B821364;
	Thu, 23 May 2024 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BNGa4RW1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC71CFBE
	for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716484755; cv=none; b=SyqkHBjeGVeFeWZ+ak9+onoBHgR26LjURTPmeXIkHj2FZIgdn9NChAJ0yFxE2txkK9eOOvMk63u/hchppRxlMl5nPx7uG+6VWhmoIwJbg3cXIKva7FnERRzvTY8BlVZPgCaTtETukG9WvOkiqegCYxH2Qp8uksjoj9p7fLgYZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716484755; c=relaxed/simple;
	bh=DVnE5XXFyKqacmVrhhH8fswgU1m18DxHHd6q0OWNAvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+YSKX2aCzCntA3gMZ0RcT+WKspm20raKj2ZSIxfTXuyB+QqiGyk9sKJXa1PnESj5JkBRxh6i0tw0lQF0+6Y00uf6064udaV96lwyhVVj/lezDsO5mh0pwbY+Teg1kadBYtxwX/zvENxV+WDb9JR9Sy2RBhOOn2C2wKsBE1RZPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BNGa4RW1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ab8e759adbso11191426d6.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716484752; x=1717089552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ta2jNkRpZUf8cR3CbSoBhJLjM5SlewpEAM0Rhg+alQ=;
        b=BNGa4RW1xwwfDOv0Op7iSciIqli7m028tR2dfhuTRSBqP25+Xy6ytUPHJfl8EE6sga
         LW9smymZjOzFWUdwws7tNMF4jI5R19xKlB8HI7bmThA2ZtJ3w5tbrRuNTYagqIWkql3E
         5z0aJB/KoJKTB6eZogEl7c938zcoFSiw0NyGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716484752; x=1717089552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ta2jNkRpZUf8cR3CbSoBhJLjM5SlewpEAM0Rhg+alQ=;
        b=RzyVgZ6F+CZwJBoVcJBjbI1sSNL+otdmiN1THyNp8iWYO51fxA1bRvvfwh6sHhAmEr
         7QQ919Ar3P3xcRYcbnmMrLivOyl+Zwx7yXHl58YA5MbiueZWTizzRROwRiC7OPAsed/z
         ZkfaUS75vUyKe+UgYUZ0B1TK+XUxOdRvWZcCbtubS0+4zJ33yi5ozceuNZ+5Qzb8NXzJ
         FWk6it+2V6qfltKbraH3xnVWeMnhTxYj3JieeFJW0NeqyxDurpUiCRDugJMnwIE/WdI9
         YOkHWVXVISs37jkW2Hq+91Znm/vo+w687C6UqG0JgVOO4qkJQR+LNu2t0eMYg8Pxb9ae
         fQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrPoYYCRmBwCh53aQUfwkAOc5FTW9vuuuhxAkwRJMElNWH7zLxN44uNl8BJ0FcIptjHF3tRgBblqTIjff43ttXPAlO9K/C0kx46ON9
X-Gm-Message-State: AOJu0Yy200985wvZELi4kpr9CuM5boEG714WDxxJ7s1chOrcG/fsHGLm
	/K8zQ9CuUSBCA+YdCWXbunvCAwKLpAXxcny/JSbIfJ/FuInP7Mp0u5ud4gMKebdAi85CuZi2g5J
	/jWCUPZMewpAg0rXkUXLe7ihvkzogC7bN/p07Zpxrx3xYWjk=
X-Google-Smtp-Source: AGHT+IEzHEVz7KmL0hBsjecHbCGnKuvYcYFJBfwFeptZXU3FzAvGW0lTgosvxriDDLx0KaipYh/KwrJ1Lwa1XOxgc5c=
X-Received: by 2002:a05:6214:2b9c:b0:6ab:9a03:ff96 with SMTP id
 6a1803df08f44-6ab9cfbe9d3mr1298086d6.7.1716484752442; Thu, 23 May 2024
 10:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org> <20240521065107.30371-2-wenst@chromium.org>
In-Reply-To: <20240521065107.30371-2-wenst@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 23 May 2024 11:19:01 -0600
Message-ID: <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chen-Yu,

On Tue, 21 May 2024 at 00:51, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> According to the FIT image spec, the compatible string in the fdt image

Can you please add a link to where it says this in the spec? I cannot
find it after a short search.

I believe this patch is correct. Since the information is in the
configuration node it does not need to be in the FDT.

> node or any image node specifies the method to load the image, not the
> compatible string embedded in the FDT or used for matching.
>
> Drop the compatible string from the fdt image entry node.
>
> While at it also fix up a typo in the document section of output_dtb.
>
> Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  scripts/make_fit.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 3de90c5a094b..263147df80a4 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compress):
>      Args:
>          fsw (libfdt.FdtSw): Object to use for writing
>          seq (int): Sequence number (1 for first)
> -        fmame (str): Filename containing the DTB
> +        fname (str): Filename containing the DTB
>          arch: FIT architecture, e.g. 'arm64'
>          compress (str): Compressed algorithm, e.g. 'gzip'
>
> @@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
>          fsw.property_string('type', 'flat_dt')
>          fsw.property_string('arch', arch)
>          fsw.property_string('compression', compress)
> -        fsw.property('compatible', bytes(compat))
>
>          with open(fname, 'rb') as inf:
>              compressed = compress_data(inf, compress)
> --
> 2.45.0.215.g3402c0e53f-goog
>

Regards,
Simon

