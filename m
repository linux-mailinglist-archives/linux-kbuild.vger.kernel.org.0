Return-Path: <linux-kbuild+bounces-351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F7680F4CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 18:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F544281945
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 17:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB9B61FCB;
	Tue, 12 Dec 2023 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDcLxHel"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EF51C687
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Dec 2023 17:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912EFC433C7;
	Tue, 12 Dec 2023 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702402975;
	bh=+h9Hy/o6qPUoywDyWEUPYa0LHvbEAwTr1e24Paq/tos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDcLxHelMIzPI8uabqZaj/J1ptw8Bbp3/fmYDq0ra7rMT0PeFkQ90OOZCAPFaUb6A
	 Pf1xrFjFQDntjBJ4litDwDD96rI7P1hbXkHlQbxzfymZPaWqFcP3fJIKPQdbiwgy5V
	 BZJhfu7qQSK2nEpGdAWBr/1DJIdxCNhkDvpMPJNKnZReAND+JosLQhQEoKLVyhjNHY
	 7QQIjUTZ9p13DxnOVCRkam5wdQ9+3tPoCM9vtVV5SAZCsuMYJISitUvT7/vXsbJMJc
	 Qmgwwdb2RgC0munn2yFEdl9n2A/m1gqB5rjiOmGfk/xWixe+wxrvaEF4X8ZUEXoRmv
	 Bu4BZ7fKxNpRQ==
Date: Tue, 12 Dec 2023 09:42:52 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231212174252.ycztjhgyhtcrffur@treble>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
 <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
 <ZXgH6un2uLdjQ48X@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXgH6un2uLdjQ48X@infradead.org>

On Mon, Dec 11, 2023 at 11:12:42PM -0800, Christoph Hellwig wrote:
> On Thu, Dec 07, 2023 at 10:49:53PM -0600, Samuel Holland wrote:
> > Actually tracking all possibly-FPU-tainted functions and their call sites is
> > probably possible, but a much larger task.
> 
> I think objtool should be able to do that reasonably easily, it already
> does it for checking section where userspace address access is enabled
> or not, which is very similar.

Yeah, that might be doable.  I can look into it.

-- 
Josh

