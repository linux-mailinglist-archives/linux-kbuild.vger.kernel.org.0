Return-Path: <linux-kbuild+bounces-339-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583D80E4AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 08:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B025F1F22240
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 07:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BFF1642B;
	Tue, 12 Dec 2023 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EbxYDLM9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2E7DC;
	Mon, 11 Dec 2023 23:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qKkN+WDYcrrRR7b+HudfeVg2AFuYxaP6rVgX+0kznJo=; b=EbxYDLM9Lk4pIpZkXV9nCK8z51
	YCd5d1LdC02cSV1apV+K2zcOxxSZoNtfVpcWrpVNadZvoJNtMWvB1ARWoJ23OJotx+tPrj4RkHzmn
	tkYNYTIMvFyRcSJ7devi5246/ihQjeDEwp2ITB/kIlrGVlEN6o22cPkUCV8tYFVUmmkxZfDpP1qhV
	lmyOiLcfhVkV5VA4bRSsj+O+kDvxpqINyzd1Au7UJ8aVNs689Uc3dO1CXYY855il7wvkUaihDjMJg
	ivEXtdTaBXv4VpnXTEumCHdc88MXEMloSq5yDkzkxaX/lbenUO1r/vREZNwzo6N9H2j0YGuK6YSpQ
	lyrO8Ajw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwwc-00AuQo-0N;
	Tue, 12 Dec 2023 07:12:42 +0000
Date: Mon, 11 Dec 2023 23:12:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <ZXgH6un2uLdjQ48X@infradead.org>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
 <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Dec 07, 2023 at 10:49:53PM -0600, Samuel Holland wrote:
> Actually tracking all possibly-FPU-tainted functions and their call sites is
> probably possible, but a much larger task.

I think objtool should be able to do that reasonably easily, it already
does it for checking section where userspace address access is enabled
or not, which is very similar.

