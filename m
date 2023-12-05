Return-Path: <linux-kbuild+bounces-258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7400804986
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 06:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720CC1F21420
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 05:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D36D293;
	Tue,  5 Dec 2023 05:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZaSI6JeP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C07124;
	Mon,  4 Dec 2023 21:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1Iv/JPivv8gaXFUDuV+9Dfaf9FrsyxCnmRcQFTbhR4s=; b=ZaSI6JePFj0g4boTbd7Suz2Xtp
	bvwRuDF87jIcod2C9Ez/gKpVeHe7+PNwOntjlaOUB2wzXYKL+dLt7C8l+pWOy4mutwV2KIDQBnLNF
	scBQ0BGcmXN/Ca6IjOzgKdOjYHoBvq8xdhDong2oYY8Haa18K7sV1q3soSW8FJlGKdhwdRVASC/zn
	m17541x3C2k6C2C/99bOX+NlD+ggPeTtrp1aLNjYYllf7X2xzePbgUBepy070arvKu9FCYIuduYSs
	/kuWwBA3j/B9iCMXrEJdQ3zYiCVT6fSQq4k4FbocU0TZO7a6hGFz68+9kIYW2hO1PvDQ+kncNeevO
	pUO82Yqg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAONo-006LQO-1e;
	Tue, 05 Dec 2023 05:54:12 +0000
Date: Mon, 4 Dec 2023 21:54:12 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: move THIS_MODULE from <linux/export.h> to
 <linux/init.h>
Message-ID: <ZW67BGhBzh4f3G3T@bombadil.infradead.org>
References: <20231126071914.932241-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126071914.932241-1-masahiroy@kernel.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Sun, Nov 26, 2023 at 04:19:14PM +0900, Masahiro Yamada wrote:
> Commit f50169324df4 ("module.h: split out the EXPORT_SYMBOL into
> export.h") appropriately separated EXPORT_SYMBOL into <linux/export.h>
> because modules and EXPORT_SYMBOL are orthogonal; modules are symbol
> consumers, while EXPORT_SYMBOL are used by symbol providers, which
> may not be necessarily a module.
> 
> However, that commit also relocated THIS_MODULE. As explained in the
> commit description, the intention was to define THIS_MODULE in a
> lightweight header, but I do not believe <linux/export.h> was the
> suitable location because EXPORT_SYMBOL and THIS_MODULE are unrelated.
> 
> Move it to another lightweight header, <linux/init.h>. The reason for
> choosing <linux/init.h> is to make <linux/moduleparam.h> self-contained
> without relying on <linux/linkage.h> incorrectly including
> <linux/export.h>.
> 
> With this adjustment, the role of <linux/export.h> becomes clearer as
> it only defines EXPORT_SYMBOL.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

Do you want this this to go through modules-next or your tree? I'm fine
it goes either way.

  Luis

