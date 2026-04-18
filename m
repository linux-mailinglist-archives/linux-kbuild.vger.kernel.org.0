Return-Path: <linux-kbuild+bounces-12837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL6ZIuuJ42kDIQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12837-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 15:40:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E5421396
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 15:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 146CA3027B67
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 13:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CCD37CD5D;
	Sat, 18 Apr 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIxX55Rl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C19C14D719
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Apr 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519554; cv=pass; b=iFm6Vxqh2HGT6qfN27CDTXHgo4+O7Q5eOd/a7r590LWnHA0MwWRfPezfEAtAVh7VuMGZFcaGLTDsZKwlO8r8ycgPY3HjnvGsxPY/bMO+k308927FBqhH8wW6bfKABxkRUnrJgzFB0hP7PxN8+bd1wVi6doEvMQYNeoR9jx4DsLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519554; c=relaxed/simple;
	bh=d4bLKITpmnH9pzxHe7TU3Fvheb79/c67RT1bq/kCK48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8eUEtKMWWbp/gSHQA4MS21OGfj+Ed9py5LyNd1FvchZYd1wrznPkSVHIGRrxf3r0xZDBhAjpu/jcB2SwuIEhX4+YMMCgwHtKdzYQZUzzYaQ/AnFIEEX9eNEoN29fyuXvAJkEv6L8SxoLiJz0Fmy7fM4FgkE2PVyJgNpOaA8q6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIxX55Rl; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso14747231fa.3
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Apr 2026 06:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776519551; cv=none;
        d=google.com; s=arc-20240605;
        b=UQpz8gyk9XjteKYmTeQNrMSrRgvTsc9BWmNsgNC3skpyKv4cgQF05/F2W5290XeWF+
         X/7E75XNJ4+QBzEJYWj2HCMrMnWn0tjj8mwqCsOv0BZk3HROEQhZsNQU6P8Qg6jJwALv
         liHJE4wJPGu69qVGXRxmLRvQ3usZshvRKj9qw+dlSserbFDEKaQnlbXFG8GJRyzk3wP/
         hDdbGqbH9OEGeSbNPbPTnHoBQdul4GoPmXS1sPx9dP3144q2J3ADiectOccvfT8bjvES
         dnueL9IZgN9F2K6TAv4/mRNAUAKJD5BIS2SWopYs3rpdeB8yISaKJ5OEuLxq9e5lzNW6
         6jMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJvC40gLFsltBxZ1uI7Zn6ceoWA65E55bZG+Boc8a7w=;
        fh=2A0hsSGULXLKl5CzCynFMnnvAyWGxpOSF8rLDb8Vckk=;
        b=ie8o8bofFzP8XbqAQjLKjFFK7I553dQOBDEG/rMcVo3Au2pjCRf0oqpXyaCNWUVJ/w
         jG4uLuZigsDVES2tW2mZzYrxE4iynpY5/p5DVU5BlsI+eAo9bIUls0tPJ6pDMAMdp+Yg
         jVpEfVJWnCHFS7Y1HUYSYCm2F4XBR7vbBYXoa7JX61375cFc1f2W0x/1WrcCQb68g3u6
         kQgD6MkSYPWRG26SPQZCmFFqJ+U7QG+XX2be2JkHb5CYiSDVIOTa0uGcaCmbuWNzPSbT
         LZjoRE8372pSCbIX2mZeMsnGGwRMP+M1cANsUQyrde8mCz0xrIYbim68S2ZpRxPSCW0L
         oy/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776519551; x=1777124351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJvC40gLFsltBxZ1uI7Zn6ceoWA65E55bZG+Boc8a7w=;
        b=FIxX55Rlbpv4kkQ2QYTXmgl1kgyrHELlM/z10PqY0ngaT2ECHK86fPtcoCjpjilt20
         twpbtYqT6DNM3jJHxkWXzIy9RvC0tNVnBodH3VPNJ5qW9FlU6KySz8AkPE93TUF7ZLu2
         ir/XoOV59UQbRwsYDLwPg4rN9JfdbkyOneqixY5P5jQaovQNDYrH9PvSQXA4A8KpfpPi
         j3h7l6T1vVieXpUgnoDK2mxIKmAPoqFsGWAYj85xUqcs0g+218xrZlTmYdDz6CZdZPtC
         I8LIRr0Pckuz6kHfDZVGJel1wDFRg1j0O3xqV4sGQfguorVuRVg4MLHSfrK0u/m7h6H8
         MbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776519551; x=1777124351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xJvC40gLFsltBxZ1uI7Zn6ceoWA65E55bZG+Boc8a7w=;
        b=icLLfT+qQELMpeMln/mNvtFOVwSUNg/YIZAWHVSBnDdv8Y66HKTExRh1G0l4c6c4wH
         N/nIiPe3ENTfcZgqGRKOtvHwdFw1e8Yk8lI+PQ9w+ERAVFu1BIQQJlBaJMC/DLw0Winz
         /cw85s4i1jL/06e4EKuaoO5hCnISZAYggRmycDw1oy0+9EysRrF5+elKmEZXDGEcZmmv
         7Oq0X8YzCH/1y/CPVQ6YkfOb6RRTHCQh2RkT93MLOuQ77piPnRjOh4wJQoSxYLaEoxlb
         rY8aOClIE9ErktbzvPuecl5H4VrmaMeFAMfV8xdST8aXk66Ohdlz++5JnxnVb9AuKDnR
         w3oQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5gOK11QtBOBr06YZeA6FCi6rq6PJQx8IT7hL9zYSKXv2GCJxPKmWO+Xwl7vOPgnk0UHD6+3wiEKd01Xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTCFpo0XK5ZhQGTDanMdZmLlagAtqGXX3w+WG3zhO/mzM8lYMF
	TkZpUG1gV+uTq78in5GA+R5QXggVm/8Rmcl0N9skAF0xFCRp6YbqRSzyQrcY79u0LCw4ZF8xST4
	dj+sStp4CA2ukWxW1FHGGeSy2z5VhMX4=
X-Gm-Gg: AeBDievyqCKHInkGgYdoFyzMDS1n0av3ESW2GgHvpsboTs/8aHsEp+SUlmOSIvK0RXJ
	wvFgxUoOAnJsG/Z5dkfoU+d4WlQkjbVD5CZPkFSB3IArPFlHV5ey+egL3QJWg0DIostjWgiIIY5
	wmSe6cUXf1WwAaPbu0YHJTfc2IX9H3SRStrFlXVqlwQhZpAEZizNrza3n7NfUklP1G0D9jt31Bu
	aLppRoHTyHRnkdg6AMZNZv4oO+gV+EjYDQG8i1fwhwBHMLY0t7aqwIbZax86DkwNFjkuIHluVZv
	oK0XEgRQRT0matStLaZo3xQE29W0+47xKK4mATxwZnZA1/yuU1kB7QUNndJ7YAkZNOQ5EOVeysI
	KRWU=
X-Received: by 2002:a05:6512:3e0f:b0:5a1:d0d:1ba9 with SMTP id
 2adb3069b0e04-5a4172ca7e5mr2035977e87.7.1776519550953; Sat, 18 Apr 2026
 06:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410221257.191517-1-piyushpatle228@gmail.com>
In-Reply-To: <20260410221257.191517-1-piyushpatle228@gmail.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 18 Apr 2026 19:08:33 +0530
X-Gm-Features: AQROBzAje9emFgJGKispWDWa7f0aHgah91MrMhzwf-cPoxhz0ANOFzegP--MYHw
Message-ID: <CAMB+xkY2judiZiTV7S1DpHuFdZg6WNzpNnn2k0zEUxXmxfBpnw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: document generation of offset header files
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	Chen Pei <cp0613@linux.alibaba.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12837-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piyushpatle228@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ruhr-uni-bochum.de:email,ravnborg.org:email,gmx.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 020E5421396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 3:43=E2=80=AFAM Piyush Patle <piyushpatle228@gmail.=
com> wrote:
>
> Replace the placeholder reference with a description of how Kbuild
> generates offset header files such as include/generated/asm-offsets.h.
>
> Remove the corresponding TODO entry now that this is documented.
>
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
>  Documentation/kbuild/makefiles.rst | 41 ++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/ma=
kefiles.rst
> index 24a4708d26e8..7521cae7d56f 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1285,8 +1285,39 @@ Example::
>  In this example, the file target maketools will be processed
>  before descending down in the subdirectories.
>
> -See also chapter XXX-TODO that describes how kbuild supports
> -generating offset header files.
> +Generating offset header files
> +------------------------------
> +
> +The ``include/generated/asm-offsets.h`` header exposes C structure
> +member offsets and other compile-time constants to assembly code. It
> +is generated from ``arch/$(SRCARCH)/kernel/asm-offsets.c``.
> +
> +The source file uses ``DEFINE()``, ``OFFSET()``, ``BLANK()`` and
> +``COMMENT()`` from ``<linux/kbuild.h>``. These emit marker strings
> +through inline asm that Kbuild extracts from the compiled assembly
> +output.
> +
> +Example::
> +
> +  #include <linux/kbuild.h>
> +  #include <linux/sched.h>
> +
> +  int main(void)
> +  {
> +          OFFSET(TSK_ACTIVE_MM, task_struct, active_mm);
> +          DEFINE(THREAD_SIZE, THREAD_SIZE);
> +          BLANK();
> +          return 0;
> +  }
> +
> +The rules are defined in the top-level ``Kbuild`` and
> +``scripts/Makefile.lib``. The header is built during Kbuild's
> +``prepare`` phase, after ``archprepare`` and before descending into
> +subdirectories.
> +
> +The same mechanism generates ``include/generated/bounds.h`` from
> +``kernel/bounds.c`` and ``include/generated/rq-offsets.h`` from
> +``kernel/sched/rq-offsets.c``.
>
>  List directories to visit when descending
>  -----------------------------------------
> @@ -1690,9 +1721,3 @@ Credits
>  - Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
>  - Updates by Sam Ravnborg <sam@ravnborg.org>
>  - Language QA by Jan Engelhardt <jengelh@gmx.de>
> -
> -TODO
> -=3D=3D=3D=3D
> -
> -- Generating offset header files.
> -- Add more variables to chapters 7 or 9?
> --
> 2.43.0
>

Hi,
Gentle ping on this patch.

I=E2=80=99d appreciate any feedback whenever you get time, or let me know i=
f I
should resend/rework anything.

Regards,
Piyush

