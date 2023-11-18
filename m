Return-Path: <linux-kbuild+bounces-60-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397D7EFF52
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 12:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195FD280FE0
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 11:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B67510A2E;
	Sat, 18 Nov 2023 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="SuU30flu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FLA3zNdd"
X-Original-To: linux-kbuild@vger.kernel.org
X-Greylist: delayed 523 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 18 Nov 2023 03:45:46 PST
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBF7D57;
	Sat, 18 Nov 2023 03:45:46 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id F40B02B001EC;
	Sat, 18 Nov 2023 06:36:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 18 Nov 2023 06:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700307416; x=1700314616; bh=Zr
	/fWLNv0kQk17CJyVu6sxw75RSfVWR6vntD48RKtB4=; b=SuU30flu847g5XcV0f
	FCQZFqm3Cdo7HbjwSBgbZC8Ee2oQreEHsvnKXcTzEamHIQUm3Sru5Nhhsy7xtTzt
	zni0ZEL0FrSMXJYQ7/g/DYSR3XDdAmsXeP1ZYQMrI4qASl1KWI6qbGLOT9m650EP
	odvcvAAVH+wAk+CeVY2PHqr7hnOCxHm4Lc4qEn58KK92Rq0GA5byA50gYnpdEwg0
	sZpHq82Tau12tqPEH4Vg9E9P7SRM3k4WN3xKnfVQBeOraHeGgCKEhr2as6kpl37E
	gpNQh1f1UtaArUoCpRMjMk8AKUNQAyUdMrMyG7hghPUVv90Bgy/7uYXflFnB/6m+
	KwtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700307416; x=1700314616; bh=Zr/fWLNv0kQk1
	7CJyVu6sxw75RSfVWR6vntD48RKtB4=; b=FLA3zNddW4gd6JJNZkKHZpGU2ZSoE
	x1ROSDleHA8aDXPIRG7MqlrSQHO4EXldW0XNoPnLOwASmCHom0scuPp3GgKJwbG5
	+WKLSANtEOiyWlyDR9IjWbmaviCatb4aLCbjCh3Cv00FCgR0sWVTM0FItdVW48OR
	ftxX5U/P0w1Rbfm5VQfgJ+TyZvDjgCZYzUTMXGGsJ9kpWChIP7K94inv1dEmFIP7
	R9oD+pzExldpFURss+edLIyuNonCFiGqBjlWAgWfhGXiPPTZODgqhQy35/SkO/up
	3rFxWPAGnxNzZyEz1MLFn+34jn4e14lRU6qpX1xbBPlEnsMHC4WdawNwg==
X-ME-Sender: <xms:16FYZWuZIDpHfOkvAD_KH-e2R3pSVwkw5J0L_SQVjIo0QiD_BvuYnA>
    <xme:16FYZbeQUYpWT_Za8B4p4ULvkTT9WuQ7z5kvm6Na-y6iuXfqwgHKyM_JUwtUa_mMs
    GQU8fctNpL_Tg>
X-ME-Received: <xmr:16FYZRxg0z5SY4tqWiAMusVhwT5QK9EpDSTPUe6J53y19-23OoLg6FIMi4kwOpufSVQmUbhoLI-H72LVlfdN91U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegvddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:16FYZROADM9Jn_nZdgWR40lCRIpOjGuyx1Uan1VQyWHMYFBfOngXUQ>
    <xmx:16FYZW9eKyuPuNLkZxKJCypALHE7vu2nb89r4p1pDgYva3yhXhu0iQ>
    <xmx:16FYZZWLiSkjYs21pyLLqREi3-lzjdUYDNuOb-H-SmcCXiYdFF4J7g>
    <xmx:2KFYZaSlbbiay2VfXzsxGgumnqDZjs0TKeU-we1jv0sIFgt8gd4UvPbgomQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Nov 2023 06:36:55 -0500 (EST)
Date: Sat, 18 Nov 2023 06:36:49 -0500
From: Greg KH <greg@kroah.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Laura Abbott <laura@labbott.name>
Subject: Re: [PATCH v2 2/5] modules: Refactor + kdoc elf_validity_cached_copy
Message-ID: <2023111818-agent-verdict-99a5@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <20231118025748.2778044-3-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118025748.2778044-3-mmaurer@google.com>

On Sat, Nov 18, 2023 at 02:54:43AM +0000, Matthew Maurer wrote:
> Functionality is almost identical, just structured for better
> documentation and readability. Changes:
> 
> * Section names are checked for *all* non-SHT_NULL sections, not just
>   SHF_ALLOC sections. We have code that accesses section names of
>   non-SHF_ALLOC sections (see find_any_sec for example)
> * The section name check occurs *before* strcmping on section names.
>   Previously, it was possible to use an out-of-bounds offset to strcmp
>   against ".modinfo" or ".gnu.linkonce.this_module"
> * strtab is checked for NUL lead+termination and nonzero size
> * The symbol table is swept to ensure offsets are inbounds of strtab
> 
> While some of these oversights would normally be worrying, all of the
> potentially unverified accesses occur after signature check, and only in
> response to a user who can load a kernel module.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/internal.h |   7 +-
>  kernel/module/main.c     | 585 +++++++++++++++++++++++++++++----------
>  2 files changed, 444 insertions(+), 148 deletions(-)

Again, this needs to be broken into much smaller pieces before we can
even review it.  Would you want to review this?

thanks,

greg "think of the reviewers" k-h

