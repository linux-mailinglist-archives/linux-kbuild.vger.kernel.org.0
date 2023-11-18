Return-Path: <linux-kbuild+bounces-59-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EBD7EFF49
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 12:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D90A280FC9
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 11:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAD610A3B;
	Sat, 18 Nov 2023 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="scYJ4WjY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EB33C0;
	Sat, 18 Nov 2023 11:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D285EC433C8;
	Sat, 18 Nov 2023 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700307318;
	bh=OgG2e3JDQ+aMaFQKaQHhqxbxwXDPAGQ1d6SyxmbzQdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scYJ4WjYaxXhSxGGMBk8baExUYwt1smeRQtnrHSE1PQUGYddkffPEMQViJ6Em65dW
	 PVnfVVo0a7IvuOeICohX8JQS0877utTtVEnz5sq9xpDwPzddIvc/FlazUBMIDHWTuu
	 LcW2yEPshGCBN/aR66RHgN4PNpeDTCR/vh1drtrg=
Date: Sat, 18 Nov 2023 06:35:14 -0500
From: Greg KH <gregkh@linuxfoundation.org>
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
Subject: Re: [PATCH v2 1/5] export_report: Rehabilitate script
Message-ID: <2023111809-mayday-citable-4fbd@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <20231118025748.2778044-2-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118025748.2778044-2-mmaurer@google.com>

On Sat, Nov 18, 2023 at 02:54:42AM +0000, Matthew Maurer wrote:
> * modules.order has .o files when in a build dir, support this
> * .mod.c source layout has changed, update regexes to match
> * Add a stage 3, to be more robust against additional .mod.c content

When you have to list different things you do in a patch, that is a huge
hint that you need to break up your patch into smaller pieces.

Remember, each patch can only do one logical thing.  I know it feels
odd, but it makes it easier to review.

This patch, as-is, is nothing that I would be able to take, please make
it a series.

thanks,

greg k-h

