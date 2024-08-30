Return-Path: <linux-kbuild+bounces-3296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 315B0966D01
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 01:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB5BEB21E18
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2024 23:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DC318E367;
	Fri, 30 Aug 2024 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BlkmYLfs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85117C9E7
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Aug 2024 23:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725061758; cv=none; b=u/UFC67CBsTQeAjQh3Q/XmHpZ44X7vmcC0/pxaiFy1f3uRLh0q8PpqyPAXNyXj7vyRjMgOg+wFscWmDAdLHtnOp38MyBlSB5rAxz2a8u6lmSI8x5lud4fAP1AvcD1lfzqBMH5H5JT+UID+ijGmf/v8Z7JYCA0Y5q2bFpenrEWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725061758; c=relaxed/simple;
	bh=E4bwRTmMN3gpdrrJ+34PGDohq3gLhiEt90gFRaqXxyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cz3+0lcBqVf1MWhqjYfuo1Sinj82T/Nq5yYX2LiizfUyB2mpbhPSXS3qNVqdMfPBSNip9kw8rbPE66SYvFnjlrr9TMisUr/hAmRdJvTiaJXm94lDr2VWxb1HadzfZ7IaryQm9RM+ErtqkeLNs4ELHnT3+HdNtBDTy2OkFp8nxDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BlkmYLfs; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4567fe32141so76771cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Aug 2024 16:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725061756; x=1725666556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP0VIEgrFYpHgeMfKEUNg/ROM1J2CbpA619iyejeYoc=;
        b=BlkmYLfsljY44QTG3HKlIOsBE0II3bP8yl2bq8tdX7jDuFTOPblVZkJacKb1DutT+a
         dPyGgDQ/SQeMlx7lO1iSM70e4oUYQqPvQ3b3Xnv0GUaB9pKSTdQT3cn0CsDH8i//svdR
         WQAE9ElP7ImYIYUvnjnIX4/83M7tOLss9V9D+dLFIwoapeIle2EsMgupJ8KlggR5V9A6
         t8S8orXlEinj36l9/5jCnhQBTdcNeCybByrqLc9+2iLNfiE85Opz5akLm0/xR+K/XWgF
         8/E7QqgBcBGFBjxYCt2l5TVJdgF1eHW2EeRanxNN3wZmtxYDIxfA3S0mvRl6c9AUOgW/
         D6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725061756; x=1725666556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP0VIEgrFYpHgeMfKEUNg/ROM1J2CbpA619iyejeYoc=;
        b=V4hjmB9vgIyPZispOaFxuI2XXQv4YLe3ZMKhC4BjYz5yZnDbdHBDuFRqSirJC2SUzO
         K5z59LVlaRRRQEvfnTbaEHZgCdT8qElqN9EQQYYttyRS2pHIpnwgkPLm2W1nE4u/kf6G
         DrMVCi3GZvZD/FZCNaSZSeRd656bc2HD3Qp6suJVdd2GLrY0v+KCx/4WheQpgIN51z1z
         mJdC66WJ15DR4DN9vq5p5irbmFCQon5qmvyXmlFTdb/QRoU5puKZvE6atkcyKdy/By37
         6CRdC8alFMjgH7W4g6fakxwpQLBzws4Nmt3qqQf7MR2SQ4JqsLxNRtLM2WzKF+xfatlh
         Mhig==
X-Forwarded-Encrypted: i=1; AJvYcCWxv8LB/HAXfHK5tN8R8dBAdl4RlDMApWRSnndb0J/plpMyiaL7PTPNw/vQqukwcGBoPQDztNto8RgQ830=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSxCHJbanV9u7CwRaMvR0jvR3dOW1B6g/ZixxJxNvLSbXYuaD
	oj6iIoXrdl0t5Lg7wRnern3/bj4ULWiGZXt/lR0lx/PsviN5xb4syIp44AANdFGSPhvu59FweOq
	cNObPcQHSVS2nyrFAtoqSJWP08yzwXfxZSpnJ
X-Google-Smtp-Source: AGHT+IGhb6pwgPVlootJoP49CP94+EsPf6u+/j/OQWLkWAwJ0wQhWQED7bZMZLKe3dOxdh7MSSDMORHBJlY90a7t6Ho=
X-Received: by 2002:a05:622a:1a20:b0:453:581f:f29e with SMTP id
 d75a77b69052e-4574543029cmr1072671cf.24.1725061756115; Fri, 30 Aug 2024
 16:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824033757.52005-1-kris.van.hees@oracle.com> <20240824033757.52005-4-kris.van.hees@oracle.com>
In-Reply-To: <20240824033757.52005-4-kris.van.hees@oracle.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 30 Aug 2024 16:48:37 -0700
Message-ID: <CABCJKufBPaVu-C4bKY=jWxOQJX1OR+7=+DE-wtcy7=d=9ZFFcQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] scripts: add verifier script for builtin module
 range data
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kris,

On Fri, Aug 23, 2024 at 8:38=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_r=
anges.awk
> new file mode 100755
> index 000000000000..f513841da83e
> --- /dev/null
> +++ b/scripts/verify_builtin_ranges.awk
> @@ -0,0 +1,356 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# verify_builtin_ranges.awk: Verify address range data for builtin modul=
es
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
> +#                                 modules.builtin vmlinux.map vmlinux.o.=
map \
> +#                                 [ <build-dir> ]

While I was testing this, I did an arm64 build and I'm getting a long
list of errors that ends with this:

ERROR: Failed to read:
././drivers/firmware/efi/libstub/.lib.a(efi-stub-entry.stub.o.cmd

  Invalid kernel build directory (.)
  or its content does not match modules.builtin.ranges

That path looks a bit funky. Have you tested this with other
architectures? I was able to get this to work on x86 builds just fine.

Sami

