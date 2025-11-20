Return-Path: <linux-kbuild+bounces-9694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E8C72C03
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 09:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BC744E3A6C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 08:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BBE1DED57;
	Thu, 20 Nov 2025 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT8hMGLi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97914A07
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626651; cv=none; b=H0VROXyk8Y23fa/2vfurqGDzONZVQjrKDtFM630Tulvovfoa5EH88b5ve63NarGPbFFNq1v11liVVVIsJs1qNLg5U1cWY8LeApuI1qFapY/V+Rs33MVA/jTcs6FT26KSLUWZ91qZj7Et2JjMDartKv3O2R7AT5ZUiQMBrDN+2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626651; c=relaxed/simple;
	bh=jSg+SjgNe59R18eQPCEufQeRLB5mrC0B/Yvf8NJlr6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1AuCUuSV1/tiQhMqUcCNJhh9tKXXuyViS1N3bOeTpw5kjNizKMjs2ZlHJFyLoi5rNZZix8lNikGi12FX9GfdGVgKBECB5xXJEaMwf1N/fMh9g15o6HZVzQwcrLvOzSYsgcRKUASQQlQoZAC6pU7ep185DR5pq4CC7d8LMZRORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT8hMGLi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b983fbc731bso92337a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 00:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763626649; x=1764231449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSg+SjgNe59R18eQPCEufQeRLB5mrC0B/Yvf8NJlr6c=;
        b=dT8hMGLi16xbgK6SbqtPAuDtyqpKG4JWEwD+7vCw6/Pv0B4E2h2thgceUar38J0MCP
         Z0Up9Uek03GchNFRTE7ik5Lsatl/4ei5+sQQc5KtBEB1kDgtIrg8Q4edfNTXrEv2PV1F
         abmiLVFihYTVDIfCK7P6cZb6V8ysSv8bovZCSDK7l8YcWIapaJDPEmcnnHOf4w1m56yx
         pVzbcRqaYxLa1OBcYXRWmjiJvGetWdy52iyuy08T8xnT+tBRZYjRpwNdvEUHYyt85MZB
         ibd7T8xEJfYFL5qKBFdLs86gmJqn9lXVTogzFBbZMsMOkqfEQ0DuEIkFDR7Y1uA1iK9l
         MPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763626649; x=1764231449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jSg+SjgNe59R18eQPCEufQeRLB5mrC0B/Yvf8NJlr6c=;
        b=R2OKbEPgGHS3HtKCi/8qHPN0yQW32P/5EAIyQCgDZL0qkU9syS3I03vkBliLvP9BTq
         A6XLEyKSn09QFmQM/AJZ7tzPDAsyhTbp3oGHpjY042CwMpG0KOhomkz3HGFeD3E21/5t
         1ZG6C85aAwUqqtu25Si5+3CLky/focHEwZBp+R4oY1adtZCn4ViqfXTiA0dLRiu6E1lB
         SsnBmOp918sSD4gdVY1g+xZf4D3D3HGVEyWQNs81xW88kITC/j8cKylER6u6pB+JaeZQ
         IPmc+qbRBptuy304Qu+IGNpCx5CBacY4E+XraMyx0cKGH7ZPCo6jSlayXcAxrCaNiE5w
         xakw==
X-Forwarded-Encrypted: i=1; AJvYcCV7q9F7nhlfQ3B5+rT2nE+BfvJMEYz1B0btevsmXfKMTYnpPOJw6rKeEB5UbeWkoaBTwVA6b/SunjhE4PU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiQ+Zyya0sKuu1LSax0WrKFP9fxk9A9HFU/XDlErLDeb9ywB/
	d9/FBn/RBUbeZEw9H9lP8+W2JdrWcOBVy/rmACV9EonYnjn6UvQAxVwAzjeaua9F1TXD7QqQiKL
	0JUJb1HHG29/LVpD2qzDI4MiWuOKzp70=
X-Gm-Gg: ASbGncsiNQMVPMEm9lkm9HMmcf7jq0/etVeDYT2zwLEsdKPbEN/ejaF7BYJIhvYpJjI
	V+WMzunFonKJ3UtWV1HLcTlDG1BLY/crqlY/by6rYnGFGWye/LUML4qFWfKGYJvlt7up7goBpgQ
	55GlqWCc0+akj+zHqckjs5IgnId5v+HoChhB9eyzkeAuYkQqxb84jjnMkQBNPhA5MpQEDRyu/cl
	wOX6v4q7YgJ7iYFivuF70HmGLH03uupQZa6iyMBnscW9AHHUD6Cf/W4vV9IIjPN+C/msySwcGTt
	yiioUyYw2GwCQI1pREzaNWEy/3PjoIGxtwc/eSnNxmnMRav/ED78TvbmbNbV0NH4MNTqxvT5alR
	al64M0H6cRD3d/A==
X-Google-Smtp-Source: AGHT+IFSV3sHtvtqDssKB2tHpRHUhWWlo+eT4mIcaa6dljUhAh5xLV/SY3Emuw0RdaDjo7y7x6bkTKs/Knf+/gs8ERs=
X-Received: by 2002:a05:7022:670c:b0:11a:344f:7a74 with SMTP id
 a92af1059eb24-11c957b8c00mr390496c88.3.1763626649168; Thu, 20 Nov 2025
 00:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119224426.work.380-kees@kernel.org>
In-Reply-To: <20251119224426.work.380-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Nov 2025 09:17:16 +0100
X-Gm-Features: AWmQ_bnDAuYyVCt0sQ-SmVRcceof0nVsQqV57_bNcnOtwbEC3sZ09od5B_8jyf0
Message-ID: <CANiq72=tzUPrDd2=GBnqxm_PmjF9nT3iVJ5ZT6AiZQqkjvdH_g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable GCC diagnostic context for value-tracking warnings
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 11:44=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Enable GCC 16's coming "-fdiagnostics-show-context=3D2" option[1] to
> provide enhanced diagnostic information for value-tracking warnings, whic=
h
> displays the control flow chain leading to the diagnostic. This covers ou=
r

> existing use of -Wrestrict and -Wstringop-overread, and gets us closer to
> enabling -Warray-bounds, -Wstringop-overflow, and -Wstringop-truncation.

I am probably missing some context, but in what sense gets us closer?
Do you mean it will make it easier to understand those when we enable
them? i.e. we still can't enable them until the minimum is upgraded,
right?

Apart from that, it looks like a nice improvement on the output from
the PR examples -- I didn't test it, but the patch itself looks fine
of course:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

