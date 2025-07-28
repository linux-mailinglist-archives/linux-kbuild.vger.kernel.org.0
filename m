Return-Path: <linux-kbuild+bounces-8228-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42471B13E0C
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 17:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2CCA3B7B99
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 15:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9558C273811;
	Mon, 28 Jul 2025 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABCZHSXj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4427380C;
	Mon, 28 Jul 2025 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753715890; cv=none; b=MbMSDWdQzvKsBuddC0YJgcN0Oxt/lqAytfniasTUlRgwTDx0AS8UDdBlJBqd4raFnUM48b/mNL3fkMVuGcEk+1dR/8Dw3Ha9RuzyeWGT7OIxikSaGxgVA+oWAJHIElJo3RmuaHJJG3YlH0FWJwiTOSDJAl5wIMRM810/pnilxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753715890; c=relaxed/simple;
	bh=bG4zIdy+dA3Y/597WfQz5S9Yzld1+fhveqk83VwKwGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEHTmKnlW9ahQ1Qk3TyXBAMUt5ZonxomOIwE+lilqv195mZiZ0NgyyimRodmYhEJlBMdiqUAsC79vUGCIvdgAdKvMT6edW7X14PMD8GXDny3db/SrixUTv2Ke8CQfzA05z8wh2l5Ndhai//KLH+v3VuLRHhCvG0c94G320FZ8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABCZHSXj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8689C4CEE7;
	Mon, 28 Jul 2025 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753715889;
	bh=bG4zIdy+dA3Y/597WfQz5S9Yzld1+fhveqk83VwKwGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABCZHSXjOos49tL59Dk8cHCSKeO/de1eGKwhkkjOA9b/Ozn/9BnHzniY9uP64taSY
	 m9ipeATvUo2PWSb6yXWgll6sRPVATUU7sA9AO4cnC/QDFNaOTldN+Fw2FPVSMzwuTZ
	 TJ6J3ZVIB7b19KsYe0H4Am5Tuqx4IJLYl6U4faFUtgGNLhy2AQf6rGd8EDxqdPiDer
	 L5MQFjICo5WQzyGXdBhXprJUCwFujIMeRNsvwXbefV4JMF+spHFyySgBGkENVzl+4w
	 I6IwDOoaDltotLINExzJbRySrGQW5KC+SEbwMA/uFST5xL/zmFBgmeQcxQ2jWr4ypp
	 EWyAkZpwcBXGQ==
Date: Mon, 28 Jul 2025 17:18:03 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 10/10] s390: vmlinux.lds.S: Reorder sections
Message-ID: <aIeUq0qYXoNIePwd@example.org>
References: <cover.1753354215.git.legion@kernel.org>
 <2860d5a5e7c6279b3836537e20b0fa0c40d2ba0f.1753354215.git.legion@kernel.org>
 <CAK7LNARV+8vZPUtX8iG_hEAt8tCchRPFobK85tv9dbJwVqYgsw@mail.gmail.com>
 <20250728140109.7289Ae1-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728140109.7289Ae1-hca@linux.ibm.com>

On Mon, Jul 28, 2025 at 04:01:09PM +0200, Heiko Carstens wrote:
> On Sat, Jul 26, 2025 at 07:59:16PM +0900, Masahiro Yamada wrote:
> > On Thu, Jul 24, 2025 at 10:50 PM Alexey Gladkov <legion@kernel.org> wrote:
> > >
> > > Reorder the sections to be placed in the default segment. The
> > > .vmlinux.info use :NONE to override the default segment and tell the
> > > linker to not put the section in any segment at all.
> > >
> > > >> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
> > > >> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
> > > >> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment
> > 
> > Thank you for root-causing!
> > 
> > > Cc: Heiko Carstens <hca@linux.ibm.com>
> > > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > > Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> > > Cc: linux-s390@vger.kernel.org
> > 
> > Hi s390 maintainers,
> > I need this patch for kbuild tree.
> > Ack is appreciated.
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> 
> But can you reorder the series so this patch comes before any of the
> patches which introduces the above warnings, please?

Sure. I will put it first to avoid warnings.

-- 
Rgrds, legion


