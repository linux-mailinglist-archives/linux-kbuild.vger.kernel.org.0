Return-Path: <linux-kbuild+bounces-10445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16239D036F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 08 Jan 2026 15:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32EEA32AE7E5
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jan 2026 14:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0027F49251C;
	Thu,  8 Jan 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpeA1Jns"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F4448AE2E
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Jan 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881421; cv=none; b=JAANIMh24/3mIYmCzISATHCrZB6qH1cPZJ2kmtUXhJwDkIUa7y+u30fw2R1GEpr8ql9WKGMmjiu3T1DTViTelnOjyln7g4alzNqoPdOrV1Wp1jwSNZfJEiuxIuBi6kIy5ma6kJQ6jt7+W+SoJbVbz6TyoyYf1RJ+QQ99jh6sDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881421; c=relaxed/simple;
	bh=j3o37ljvU8WW3JLmg4pFonRiNxJi7xTRwgos4PfkORA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOSts2gdJy1BKyq4h4VRQfV0g7aGnM+vZu67dkT4L/XBAH2/C4ewwnLqBfJsE1jIYcynk1s2BTLzqVpDMQAUdDP0J2vjiqFpuZBVp7USJXxh5YY+0z9Y7QzZB2VSL5JU1qvzXHIVov3eTbRrLx4eOBwZx/i0RAGy1m4pM9+4zqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpeA1Jns; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b05daf2e4eso34543eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jan 2026 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767881419; x=1768486219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7jDvUFCjfFtmadOVjljTYdbYZqDf8COd2PlPO/Cyo0=;
        b=cpeA1JnsKQUknZFaVdON2sr7SjXjkEBc7nMnIArN5iF1m/flAOnokYI68BAfjrDe2Y
         6ngLp1c92vrcFBrWycvdpYDEA2DYQqHuRg7CY2BUdrb0lcDkRt0Ac9CLJZgdkR0kjlN8
         +Ww6zafbb9eVrvuMUmWN6Cd/liR0cGMoQlbE6ZlnG4SQLoDIgL1x/oF7XJINpZccoNfR
         RJgWlBaUVTcHiGmjQWvfLtaNNZTx5pySrf6UB/XowLYxeVbmTr+Dpuf35piJ0Gikvgk8
         EtUWd09e7jFlEp9UaMZJ5O+f1zjvfZrqZAjBf0ru85glge9ESAVOtsy3yAucgIxnFL/4
         WTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881419; x=1768486219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f7jDvUFCjfFtmadOVjljTYdbYZqDf8COd2PlPO/Cyo0=;
        b=ZUFh1+QFh9sPkzRYdLcN3aDqc6teDOc9ZyOhkhnMaHTs0vPe/KFICSRlYq4JDcBM4M
         zMPelHg5LaQFSLjOs63knVozevZEFctjiEjPAgNPsVzdsXzY3vCWCUv3OOCrs/S6wV6f
         /KKnYDGZy7KbmFtB9OxQ2jjWr1YIL3ThPHFgxtHYho4uFmhT5p/SYryL0tGWo1cUb5BR
         vzB0OKX4DCeZh2ujWk+WlQpJekkcR+cIi7q5ZSNYNmI0T2cA5dg8cSX0Yif2zQ1Jp3Ya
         E8k6u+aKaDgOCLYS5S8hO3JCu/rYJheLhLLej2rHz/16CsTLyVLFGWtVnaFk4jBR/MiS
         YD+w==
X-Forwarded-Encrypted: i=1; AJvYcCUNqsICfQ4q5jVhGLjB7MEm1KSw4dyOben5IuaYNw5390o8pEiNajcP10u70ztXeASxhgan+lIj3xlsJBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygwZCl2J4+pjcLfSDUwfYEbrbdriJNeOSzMzNwXKTCK9Cz8zbU
	1k7LtzXPSvIrB5+hiKquB2bco0YeZGj6KYznLrhYJqgFEAOuwrvx40bF+H9Aiqw78t00gZV5Pzl
	HIGX8vSPJ7C5xuprxZH8rXa8bKIBQOvQ=
X-Gm-Gg: AY/fxX7Be5oBnQ/0+/lM2Aocofozxg5PNzDiG9XZY7NTk80Rhl0ztFjhffSY29dDzL8
	WD8OYpen1s8jjUYXyjKO3oQUYFHjLAiTRriC0M60m879kFISTK0Qk6rGQXxrCdU7MRWk0VIIYHI
	1v0blZ+lQFeAVnBv2ExZkPEBHspe6Htgha28Eh8wq0dcr4flzSmahRVHATZsQNPWteOmWUSu0TW
	VditKO8RZI0fzLFzr09YS1H6swqMpFrTdQ5uLH+0D0OdFfanLume0mycIjpgOoFinfL50Vv6WXe
	8DN1X+CF1mSi6a7wBgMGnUlT/UZC/2F36VoZGgORu/nIPEutWmgxQYNDvFI+rpNn6Q8Bl1cvUMr
	j/q5U5CRSQ0l5
X-Google-Smtp-Source: AGHT+IHNeMjlzueJHkJLbN74lNQFyQb0gOywPBPdlNCJT8fAFTRMjn3wgKYlbOnJAnxGIEInLPyC5bkUa1Vxsxwj5dc=
X-Received: by 2002:a05:7300:dd0c:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b17d30fd2fmr1936203eec.5.1767881419200; Thu, 08 Jan 2026
 06:10:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>
In-Reply-To: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 15:10:06 +0100
X-Gm-Features: AQt7F2q2cgHdJNNgrL6_JC_APYg1zxqroIvS3FffCSeaIG9gIAOBm2Oruoyww_Y
Message-ID: <CANiq72k7_Vys-UxF=34eouu=CquaTXcb=jMiTwVb8mhP=SGEYw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/kbuild: Document gendwarfksyms build dependencies
To: linjh22s@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:45=E2=80=AFAM Jihan LIN via B4 Relay
<devnull+linjh22s.gmail.com@kernel.org> wrote:
>
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")

Not sure if this is meant to be a fix or not; but if it is, then Cc:
stable should be considered since that commit is in an LTS and a
Stable kernel.

> +Dependencies
> +-----

Shouldn't this be the full length?

> +    sudo pacman --needed -S zlib libelf

I think these are supposed to be a tab (at least this file uses that)..

Also, Cc'ing linux-modules@vger.kernel.org as per the "GENDWARFKSYMS"
entry in `MAINTAINERS`.

I hope that helps!

Cheers,
Miguel

