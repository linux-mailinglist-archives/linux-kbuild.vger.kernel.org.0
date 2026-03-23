Return-Path: <linux-kbuild+bounces-12208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJQUBnqTwWnuTwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12208-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 20:24:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AAA2FC2B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 20:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA0E832138C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FED30DD3C;
	Mon, 23 Mar 2026 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoiSn7UK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB1F2F8BEE
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291341; cv=none; b=df/osoRXS62tQLFN4S7UtcvPit3adZ0eEO18p+Iz0pKn5Qd6i1Gll7SYNWkiTo6M5WeTl1fCSZf3zUpqn5hfrvsvndIf/GOQaFOJQm59I9cuUw/5SDsGAhLISFu0bVGSvdHMbNSmQ+YOUz4iRanKN3gqPl5tJsgw11OYddKnU7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291341; c=relaxed/simple;
	bh=HaY7bKz1vH12gbhp1PtTn4vwQY93r9ABoNwuu9whDoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUBObV/GShFaFuSgj62YHC4LOYBdrqbIMaAV4ntUOz/2TiyCmGnVRdmOiZ9c7vqnxsdAmQcpu/WbomVobhK15WBP2R0Mgyhmdq6RGdzlUy/BrBUEEh/gzrLcCF68u02kaMk6n03LDFvukHsSoq5CUb8PXvlvYqNIBiNc6+xFYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoiSn7UK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b7ffed973so267633f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 11:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774291339; x=1774896139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dxdEUh4IB/1SO39Kw7tCUT3zJPN5Zqv8A5orXaxobs=;
        b=ZoiSn7UKh45Xs8DemRyGQkX6wg1wi/xB/mh0Nk2gb3C0VptpGXBRR0BljC4CxB3Uf4
         S1vWhmeInbmq+8TJAK8UBffc9uqtwCHdi/Mv7cuxYgVBxOcWqb8+N092P53um60emiOa
         EEr4Ioz8w1WW7Axoq7gIyfT/99VI8c8JUIFhFALos/DLk0YK57w38IuU6tC9uJevpLfo
         f2x/i6OetBO63uhtqt6pY4r07kuz92kUgVVbBh0iIL7kXy4ygg0Pukdjw9Uz03C+Xl6F
         Uj4feDBujI8Gr6TKnUoE+x6IT8oxhb1mS2SAx0ac3B1xt4TQDlcQn8TF9+hLAu81qyWW
         KVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774291339; x=1774896139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dxdEUh4IB/1SO39Kw7tCUT3zJPN5Zqv8A5orXaxobs=;
        b=YuJlgNT9O4wkOxVgtKWauZ6U48xY+47AtY6UBjfJmFhsjipchmtqJbkOB02uGZCznv
         c/txgh0cb0N2Istlzx98ubxjlLEo1SxlMjZ08xKC0AIBNU0JNXW59Hz4mAxYj7CXqkJl
         JDSoHZ+XWtVSu5cSyCf4m08QANfUpfoPkrv4DkRfhfHQMrvvp9ibh/tdwTCLaB9a0j4n
         xJtSRnTNwI0LSnqll4Se+KHF+kejIkgY46RjLwW/I1tzsXK1xZz3nqCF/kELk4LNyqfN
         h5n1rqX8aoU1tgqJBW1BsbeVKWT/JFBwJjx9j+jtGT3fC96MW7QpWULzKJHvjCLrORTd
         Nq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiOJo/MS2sXIwejTXOz53U3902zATtWnRsXc7jyqasiSTp1rXMBmQOoupYsHyg93uWbTRJnGn6Wksu4h0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1JyupcbZ7/H987Blh/puniT2SgagCEowpBDZhQ4FyNuYYa6Tt
	1j7g3CptFJroz2Sba+EEMIBXrIZdzP7sRWNoWLlsrxnQGvOZSAz+eDw=
X-Gm-Gg: ATEYQzxQieAknBvhntjReWJbTdK6k6aMCMc3p/x2++xyoSmBFFpq6zXs7NWMUMGUB3c
	pB3z+GoYeoDDvalnV61FZ6lUM5rHgMOxSzk01hmecitlr3wEU1KWHbf27UNopNFpzCEyOY1yqSc
	UkIocwiHTWRyHBZEb7GWalGOU1/h9ak7FnCIXSE4GH0iFR+8tH4gYpD/nX6uHTS+WkVXOoW9WG+
	eLYcfvo72Uyy9nc4MMJ7HOWTMI6JDiXubmASIZ9ahAOew3IYeUpEB2d5c6dNahCU+66JuhlvIz/
	p2Ju0VOWFB5iVNYMTRZj2ULkpFI7Ibl2FpCXCgBe/NB9E71zbzi/jX6ciYJUaJgu8qYFQkHR6Kp
	75Sy7AlGV61OBBvzTQr9GnpOcrZuM3hgUi2Tnjs6/ye4XzPiLOpCJKZb7tNfNcoSPxYP2vkvw56
	XzoiYCYJ1yq5gBoMnZJ2Lc99YSRj3U3gSuV5lOEFaGZriMNOKnEerRY0Mh8L/MiIkoCQg=
X-Received: by 2002:a05:6000:290b:b0:43b:576b:5dca with SMTP id ffacd0b85a97d-43b642442f9mr20708049f8f.16.1774291338529;
        Mon, 23 Mar 2026 11:42:18 -0700 (PDT)
Received: from p183 (dynamic-vpdn-brest-46-53-134-188.brest.telecom.by. [46.53.134.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b243sm32081677f8f.26.2026.03.23.11.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:42:17 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:43:59 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>, Alexei Starovoitov <ast@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>,
	Kees Cook <kees@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Juergen Gross <jgross@suse.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Petr Pavlu <petr.pavlu@suse.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/2] kallsyms: show typed function parameters in
 oops/WARN dumps
Message-ID: <cdd61497-8d50-4fc5-aec8-47286e23d537@p183>
References: <20260323164858.1939248-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323164858.1939248-1-sashal@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12208-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,HansenPartnership.com,ideasonboard.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[34];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adobriyan@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2AAA2FC2B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:48:55PM -0400, Sasha Levin wrote:
>  Function parameters (paraminfo_demo_crash):
>   uts      (struct new_utsname *) = 0xffffffffb8ca8d00
>    .sysname = "Linux"                        .nodename = "localhost"
>    .release = "7.0.0-rc2-00006-g3190..."     .version = "#45 SMP PRE"
>   file     (struct file *       ) = 0xffffa0a3c250acc0
>    .f_mode = (fmode_t)67993630               .f_op = (struct file_operations *)0xffffffffb7237620
>    .f_flags = (unsigned int)32769            .f_cred = (struct cred *)0xffffa0a3c2e06a80
>    .dentry = (struct dentry *)0xffffa0a3c0978cc0

Should this be in crash's format?

	struct dentry ffffffffffff0000

