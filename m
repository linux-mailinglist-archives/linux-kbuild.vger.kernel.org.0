Return-Path: <linux-kbuild+bounces-344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDA80ECD5
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 14:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A38E2816E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 13:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407E660EFD;
	Tue, 12 Dec 2023 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mbTexFMv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2641A8;
	Tue, 12 Dec 2023 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xC107OSUOyrS98vT6lQFgwTVXofuMQmJfl8JtYjRS6I=; b=mbTexFMvREG+oGVg3ZJAv5AJlp
	qbaEr5dxBs83kUiHFd1ek8KnX8G0L5eAHJTwNzOuGwkzBFMuwO8e3pLmAV7py0IWFPnj9ZPtbD7bE
	+vAKCwuXMQwlqMeFacYW3qrGLJJUFWmOir2bbZqYNPkZP7P6T+mIzwl5/pRFqKi5gyjxwLYeRm7iH
	oBSdEd3HMX1AKD8+5ug1pThQ2TK8wyvsuaWS1P4XDy3uM2ED0lRZ7wQnCKu3O+97ikbnBuGFxSXqT
	83/Uqen0eL4XlE4+3FtB0sHztovzKK5/IdXnLrawkrM95EtJnIlIH1cemAW44kTgJLhOHErGiajmm
	Zc9oYqHQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2V0-00Bkzy-0i;
	Tue, 12 Dec 2023 13:08:34 +0000
Date: Tue, 12 Dec 2023 05:08:34 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Leonardo Bras <leobras@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
Message-ID: <ZXhbUmxzH6nWAzaw@infradead.org>
References: <20231208181802.88528-3-leobras@redhat.com>
 <ZXgMa57Ere6FJCJB@infradead.org>
 <CAK7LNAQiJW0eFYQZN0wuURhrdc-8y7=TcEazpxhLf=+mRbKHHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQiJW0eFYQZN0wuURhrdc-8y7=TcEazpxhLf=+mRbKHHQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Dec 12, 2023 at 05:09:21PM +0900, Masahiro Yamada wrote:
> Unlike .gitignore, this feature is opt-in rather than enforced.
> 
> To use this, you need to run
> 
> 'git config diff.orderFile scripts/git.orderFile'
> 
> or
> 
> 'git diff -C scripts/git.orderFile'

Oh, ok.  That greatly reduces my concern.

> 
> Indeed, the file order is subjective, leaving
> us a question "do we need it in upstream"?
> 
> At least, it is harmless for people who have no interest.

.. but this is still a good question.  I'm not really sure there is
much of a need for it, but as long as it doesn't harm everyone else
I'm at least neutral on it.

