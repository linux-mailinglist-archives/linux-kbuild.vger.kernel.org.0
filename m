Return-Path: <linux-kbuild+bounces-340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875880E4DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 08:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26C01F22D7B
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 07:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE23168DA;
	Tue, 12 Dec 2023 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yA4HlQ9i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1F8BE;
	Mon, 11 Dec 2023 23:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rr54eCZeM9Bxbn46edNVm7xvL1Q/VdLAN/WkKi1Csu4=; b=yA4HlQ9itEHPME5W0PkZ9Kf+d0
	kxgVuiYZBICWhXv8zyC2Kg3XXnZ+Bi6ilNVY9ke1tW8EBGkzNEbUgbw9liY/qAOmQFQngXuxFAmH2
	jyFZTU3iquxKl8L+GmPCCBFdh72mcmfiW/ikK8kT+IsHu3Da+NF5wewcrukRQB9QtHLXyDklhNg5Q
	EYylBUjvzxK63/5LgH6sm4mDznTguYbxaRqayOnlMgmccsFDUFTUHn8eNCF1kIX/wzO3XwvRv+YWC
	siIKKLbdZa0Kp27DpDELKeWdiLaDMsj/Cu0A3PN1IjDM/z5UN15fDHJw9U9zC2vopVHIQ8UJ3t8wF
	U5UjAMBA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxFD-00Aw9f-1Q;
	Tue, 12 Dec 2023 07:31:55 +0000
Date: Mon, 11 Dec 2023 23:31:55 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Leonardo Bras <leobras@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
Message-ID: <ZXgMa57Ere6FJCJB@infradead.org>
References: <20231208181802.88528-3-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208181802.88528-3-leobras@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Urrg, hell no.  Alphabetic order is the only one allowing sensible
searching.  If you have a different preference use your local .gitconfig
instead of enforcing completely random preference on others.


