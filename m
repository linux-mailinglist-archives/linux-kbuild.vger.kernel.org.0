Return-Path: <linux-kbuild+bounces-185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8087FC075
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 18:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC031C20AD0
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 17:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7421E39AD1;
	Tue, 28 Nov 2023 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uLxxv4vc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5B71B5
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 09:43:01 -0800 (PST)
Date: Tue, 28 Nov 2023 12:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701193378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rpzb16wTQD+aymEz7SbZXRnLQFtDSOEzXXEggagV1Bw=;
	b=uLxxv4vcSO9YksdxfTHkWbHgRKpXU4VwhsHNZdHVGBfVRZp3PO/4XWvff/Ra12jx4FxCoc
	KTT5/cfU9Lyyl5K3pDJ6mOpjHHc+IS2h0oDR+N9RbFJI6ph+OrP66AUFznCPPGllafPImn
	xBjGMFufaI0GKPWEATMqtNyJJr7BTf0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: Allow gcov to be enabled on the command line
Message-ID: <20231128174255.xd3yji7rhwijkp75@moria.home.lan>
References: <20231122235527.180507-1-kent.overstreet@linux.dev>
 <CAK7LNASQ+btvNOZ8yU6JLXBHVzPaEwj-7z0_dFouw2EUKd=3uA@mail.gmail.com>
 <20231125195620.rjgkooixugucv2vp@moria.home.lan>
 <CAK7LNAT3_rk7xysSGnzq1carsght6gziyCnwEX=fjXy-KwhQEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT3_rk7xysSGnzq1carsght6gziyCnwEX=fjXy-KwhQEg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 28, 2023 at 08:44:11PM +0900, Masahiro Yamada wrote:
> On Sun, Nov 26, 2023 at 4:56 AM Kent Overstreet
> > It's consistent with how we can specify options in makefiles for a
> > particular file.
> 
> 
> It is consistent in a bad way.

That's a new meaning for consistent that I'm unfamiliar with.

> You used "GCOV_PROFILE_" prefix
> for the full directory path, while it is already
> used as a file name which is relative to the
> current directory.

And the current directory when you're building the entire kernel is the
top level directory.

> > I suppose CONFIG_GCOV_PROFILE_DIRS would be fine, but your patch isn't
> > complete so I can't test it.
> 
> 
> I do not understand what you mean by "isn't complete".
> 
> It is just a matter of adding the config entry somewhere.

Yes, not complete, meaning you haven't even tested it.

