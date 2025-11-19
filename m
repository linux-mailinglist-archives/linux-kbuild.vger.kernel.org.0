Return-Path: <linux-kbuild+bounces-9686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC8C70A6F
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 19:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF3434E1F0A
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 18:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ACD189BB0;
	Wed, 19 Nov 2025 18:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="izlcdAOR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DA930F7EB
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576776; cv=none; b=nX94iiXAq1eKVDDXORxsC0yHrabRyjPrun0ZODRd0mgYBjmZ1NU6dtKDpuX2Xo3egcsK57Pc/Ctb8+MUe6QZeenymS6e8522hZKGN1RuRx3hAUczStnsg6zsL0Y/YJ1x5A634iUzVEn1HqgqvzawNicmG62D4XSRDx6o40UWTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576776; c=relaxed/simple;
	bh=EjgUwYT+g1y2JFx/9PFi1UuA9kC+2dg2j0/sfmhoYbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjZ7l2UhJUm01S9w+hAdM1fY1l1ha2XEQ85vBQo64j/R9jxRGHYPkrO6OsqU2HutMSVtWeqn4GPsFhhYuPSFEg/WAXGISdyp17sefMGj0KwvqVj48IRO4IsgEzqxVJET3UYuXxUUHgrZ38lcLE+ZvPaiMAYCYvKFwbJzDG2Rr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=izlcdAOR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735ce67d1dso10178966b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 10:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576766; x=1764181566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/0k/786NNZrTNzgG2V0hJHswcQ0gq84yCvnxP+cqo0=;
        b=izlcdAORDiqeOg1ABywnNcEdmm8sMq74cdOGgSLvPx06WhQ8qmXztEqfbvgk12ePAL
         UFmJuxViHPskDCkcYH4s0W0I6YGEpfYrTqoH4tuTD9J5Q+NEqeoKYsn56LoL2Sn6WBE+
         UuJSDfQZBQAgT3lnEcPfD6AzJ3PZFabXM3Gcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576766; x=1764181566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/0k/786NNZrTNzgG2V0hJHswcQ0gq84yCvnxP+cqo0=;
        b=JaDc3J9sx7+WfhV4666VMps0FMwY6if7ELtQRmEvbHOQwyt6M6vOkmYzpBk9GqHZuZ
         teage0YXEAVkoxmvs0k9k4h5QUjbI9E7WH26gxtz2Wpb+sh3bFflH9WiIcGhSyq+I8rX
         vpYeZWMdi9JbKJd+H9d25Oy7CukEmgvvph8vu8zSw9K5MCkvC+pWM8REzNsrowZjLZI2
         +ys/b9ACx/748TON1f7jWRA/ZsjXkMGb4mrXVNXf0ulmfe1cJL3dPkF1sg3AioQwsq+t
         Kpm48LxOO0Wp0/umuAwHcOCZDIUjavbiN1+qrv/m6LOVy4gueCUMCjzi8qJekso1cqOS
         SpBw==
X-Forwarded-Encrypted: i=1; AJvYcCUVgXyJsHbxK2lZ8PkQibMbhlmf1pMBJSn0ta48Q4XaeLl9LsyNbLPSbFkrtuJDmiZDtgvkzTO/zfkwFwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDjRFlgtZSPycF/YfQWIrEws3B1xxH/KVxKX5wWVS+ERRtt/I
	8gN/dj3gB7YQpJNXp19Rvq8RdCrIfixSrmEmC8+AiNwV6/37XT51UGJYKtwkY054dlgUYzxspec
	8yd51cVeZvvN+tY/ZjfseepmXg3YjBJEuZVsPyUh2
X-Gm-Gg: ASbGncvofO3Z95yU2vJXoFRmYIKsJDhRtm09mbf1ipKc9Wqo/sXn3YlyJRL4qoCg7qh
	ReenSfb0M29u6H3UgUtTjxrODuTMg4HgiR5+N4D6Wxm+9+caqp4vVHPceyaEX6c3s0K5cBDEvno
	+sle5qQIjGRlKBdliUPCVdGUAM7Sg4H8+bD3ZIT0oFMK00pnJc8yFquVKNj1LnWLn2VAPXREeyL
	Vdf33UAEbxm/1y3CeW0l+7DAGur8qGVavjzE+BOxksemhoiCqRCy1mT18T8lIwAn/fWO9Knlnbg
	PoyO
X-Google-Smtp-Source: AGHT+IHn7Yl6CGz5ri+HRljjRFX0a25EhIRT71njQxzQyeKofDCi5+wW9Azx6XhEPOmwLRjPV/Xb+auFfcON9bFBCwQ=
X-Received: by 2002:a17:907:6e92:b0:b76:26bc:f95f with SMTP id
 a640c23a62f3a-b7654add587mr16158266b.0.1763576766217; Wed, 19 Nov 2025
 10:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
In-Reply-To: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 19 Nov 2025 11:25:54 -0700
X-Gm-Features: AWmQ_bkIPSrFQXttxhwEtB_FMvOnOc5OuQ1pu8cpgAf1EfFaq83_ktFA5Z_JgR4
Message-ID: <CAFLszTgxLfDucOJK70EXh6PXGMcitC1_8QyWGo3DeruQnGMx+A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Nov 2025 at 07:31, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> From: Sascha Hauer <s.hauer@pengutronix.de>
>
> Add a new package target to build a cpio archive containing the kernel
> modules. This is particularly useful to supplement an existing initramfs
> with the kernel modules so that the root filesystem can be started with
> all needed kernel modules without modifying it.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Co-developed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .gitignore               |  5 +++++
>  Makefile                 |  2 +-
>  scripts/Makefile.package | 17 +++++++++++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
Tested-by: Simon Glass <sjg@chromium.org>

