Return-Path: <linux-kbuild+bounces-1945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA88D1E43
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 16:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54FA51C22D23
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 14:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1E016F831;
	Tue, 28 May 2024 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dY8/4wcG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61F416F291
	for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905699; cv=none; b=sOWqtJ9e9NbvXo6H/LSZqXebNtDG8teGutZ0AHvIEK9Lq9sf96Ezl3y1cBzDWorgHREQR/JJV+jWNgSB4ULj8CDswfGa2kyot+1RO6k9ri/Ednv8j7ZEc1T+y8g3whxS3r6l0pc6g40Hr78uvDteEE8FYRZIhedOKA7HAuA/Shg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905699; c=relaxed/simple;
	bh=A3B7DkRNnn1sAujL7DnS7K9eFHSqkhpLjb2bEuC8kZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcKE77YxJZN9FFA3HYb2EeqBNlD3+tgbNCIoznDbqVA4HqxoEP5IPz13vIgyHe/YrZN3htgHl2HWdYVLfefAA50NckJPPc07eDpK+B3HCbzYHjuQYj7oGCkO7Jn5y6EknEav4QHoE6MZoUkK09i1Z05U+wiQNNmevM/atRZI1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dY8/4wcG; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c9c41cdc4cso256387b6e.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716905697; x=1717510497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zittrK0SuyPjIL+AeowzXGFUqlIKj1R5LpUEGnglOow=;
        b=dY8/4wcGnJVVGatixpN+BfixpO7KcxzhpNc9Fv9i3hjgcwtsrTmWDk1x8hyI2HvWO5
         rv8sZRvv4tV77Ep7PDV8Y0TLKlOAj6kJ6ZvO0tgHUgFQxN9ki/3eJpnM9C1JaDaw5E1O
         80zkGRTz/w/swd3siearXlXq0tFEY2WWk4l3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716905697; x=1717510497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zittrK0SuyPjIL+AeowzXGFUqlIKj1R5LpUEGnglOow=;
        b=umky/v4Ts7czJoas4d2+skP4G0MyN3COWAZeJBtgt19jl5+ZlkJR+p8N34OwiJsskj
         uzyQ4BWCJHhmVnh3GsrNql1G0xis5Qh/52nZQSVU8C/7DUX8wWtxyFfodG1qVfSkSqLW
         DakdO4aLuRwk1xIUMJw4O02/do4Y5RO9NZlIeQL77GJVAEXtoZjtpBxoFvTjgD+QJUFF
         C/yB//UI+xfnz2btMuPP62Xqe/BJZwBlIB1Q0w7FhxglJ60hBriL2zvpwLBjQ/AjT7XQ
         NM/7zxcN6smv1LW/X+hdwOWoKsAIk9VbQ79iiSq9ZLw51esAuVw3qZEjShH2ZlGmJ1W9
         Uuyw==
X-Forwarded-Encrypted: i=1; AJvYcCUVN1jlLWVuVnVINoMCjr0NDLWIr/0iig0woD771SjPfZqguyq13gg3jX7aXb557Wy0xyoIwVdiFL4dZco2VqAPVAYvJjx3hmlCFr3P
X-Gm-Message-State: AOJu0YxNiQywhpDRFOwF5HCnPOWWrtt2/g85BIxZwmug/xvvAtCgScXJ
	U7uk9SkKQ4wyQvGpV+0qRFgV2U5wt82zk0S95n5s4XqSv2r69J/8lvcxA5KU8sY28e9ma0XAiHP
	M2PpV9EP5eLjQfaN8lZQ7JH/Cn/dqLwvSZzxG
X-Google-Smtp-Source: AGHT+IE06UeLLaV5hXYkhGE8SfRF9xex+t5CAfAb4fwmYcPWSOsWMJuV6/47FzJTHqjm3DXehq6zwtMtgDzPwvfoLSY=
X-Received: by 2002:a05:6808:989:b0:3c8:665e:1e57 with SMTP id
 5614622812f47-3d1a5e2d421mr14592426b6e.25.1716905696879; Tue, 28 May 2024
 07:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528085221.2989315-1-wenst@chromium.org>
In-Reply-To: <20240528085221.2989315-1-wenst@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 May 2024 08:14:46 -0600
Message-ID: <CAFLszTg+Gg=wZDAWX420hA1N04OYM1TY6Yj_JAq4X98TPwaaTw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/make_fit: Drop fdt image entry compatible string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 28 May 2024 at 02:52, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> According to the FIT image source file format document found in U-boot [1]
> and the split-out FIT image specification [2], under "'/images' node" ->
> "Conditionally mandatory property", the "compatible" property is described
> as "compatible method for loading image", i.e., not the compatible string
> embedded in the FDT or used for matching.
>
> Drop the compatible string from the fdt image entry node.
>
> While at it also fix up a typo in the document section of output_dtb.
>
> [1] U-boot source "doc/usage/fit/source_file_format.rst", or on the website:
>     https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html
> [2] https://github.com/open-source-firmware/flat-image-tree/blob/main/source/chapter2-source-file-format.rst
>
> Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Add clear reference to U-boot docs along with excerpt
> - Send separately from "disable compression for DTBs" patch
>
>  scripts/make_fit.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

