Return-Path: <linux-kbuild+bounces-8567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67372B33C34
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 12:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 339481896AC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 10:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221D12D9ED9;
	Mon, 25 Aug 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R84dDUek"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A52D948D;
	Mon, 25 Aug 2025 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116604; cv=none; b=ajTdACqzCyzTFhTrMnaD2uZkkmn0ggEwXbTncQ/7BdiQDmzeYHVWqOgqfYQ1tQMBOGM1Utq3l3qnWjBJuXnOn0d0IyrEfCfJzowffObhw3cNKzatilhNcOdi5AhgnGktM3yMV+h8D1ZAiLivcR7afZ57Pg7yB79m+3SlJ6tX4No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116604; c=relaxed/simple;
	bh=y2WZ+B7tgeuKJW7dG7eCxLPf07QClN6hhHPYNmFlzh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0YkRs5MxCAbYQthp74RVsV4GlvUIvD3HYWiaZn8xgHavxCe7hTG6qGQottGYKETmn1Zbo+SgvA+AdJucLPGAmCl4A1yGgsYKRL0CXgkXqCr4FC8kWFbnG4GYMw1i6E2F+2MWeqCo9b6O/9EpwZmH3WtjFHyY4NmSgUgZEVdzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R84dDUek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A3AC4CEED;
	Mon, 25 Aug 2025 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756116603;
	bh=y2WZ+B7tgeuKJW7dG7eCxLPf07QClN6hhHPYNmFlzh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R84dDUekJqdaEOIacf9j3xK+NqOW8OLGOyByxdYxUOLU94CfwLOaxaQt66m5ESk2W
	 ZmO01EPHsoPzbIWZ0Nl5bX9m9Owsmnpj2QymCNGi9Dp/IcvvIkYmbbSVDIT5GKD2Xo
	 1cOO4RYUWnw4AZ+/GlW972LthSDcFwGoFbrgLCSvdsO74uYWdeU7zcj4/evUOIBYjq
	 k30TJo9qjysxgdQdXIk1hxsLJZH4RBbgwBx70LhiEP942EaiiUc+HeprdGNN3n9a8M
	 +LeH8TgScRyMavWvfVwpTsYx4dLx7BLFfAAjkNz0ZI6rkGC/3P8WZBAl8lfvSC6FMN
	 R9R9F/lFjhqxg==
Date: Mon, 25 Aug 2025 12:09:48 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
Message-ID: <aKw2bKTjmHBGjxt_@example.org>
References: <cover.1755170493.git.legion@kernel.org>
 <93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
 <yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>
 <20250819071817.GA1540193@ax162>
 <yq18qjeyd4a.fsf@ca-mkp.ca.oracle.com>
 <20250820161142.GB3805667@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820161142.GB3805667@ax162>

On Wed, Aug 20, 2025 at 09:11:42AM -0700, Nathan Chancellor wrote:
> On Tue, Aug 19, 2025 at 09:52:10PM -0400, Martin K. Petersen wrote:
> > >> Applied to 6.18/scsi-staging, thanks!
> > >
> > > I think I will need this change to apply patch 7 [1] to kbuild-next
> > > without any issues [2]. If there is little risk of conflict, could I
> > > take it with your Ack?
> > 
> > Sure, no problem. Dropped the patch from my tree.
> > 
> > Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
> 
> Thanks a lot!

Has these patches been added somewhere, I can't find it in kbuild?

-- 
Rgrds, legion


