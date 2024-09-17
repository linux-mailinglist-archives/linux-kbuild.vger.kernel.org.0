Return-Path: <linux-kbuild+bounces-3612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E797B5E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 00:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4B001F25E31
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 22:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AB3166F0C;
	Tue, 17 Sep 2024 22:45:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3415C147;
	Tue, 17 Sep 2024 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726613127; cv=none; b=SNxcC5Aa3cV0yFvZj3dJBD0A3u2+TE+jDy9ZEOfXGS4kG7O8LZ/Nao0NuG+8ogUQ9/ZclL80SkQ0/ZBpkv3mgPaWn+7JAaGTF+zI9T/b0zqm4BiGpbytDSytrs01dV9fx2khRdvLLcP/biQfa7d2wXiMVMJVi8kKU9CAd3/G3rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726613127; c=relaxed/simple;
	bh=Hw9iyrJ0e58e+rXTCDQUpQH3J+dNdJH/7seORIpje5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scHVXeSyoZl6ibbZ+y5CuMZoIP4So25X9bL8kQ/mehJdpnaCXh/qjUJrc7MJewTPUFp6m4eV8eKO5T1Rj5Tr/Q8GqZXEHwWFqjlsljdlsL3y5bU9IshtT0O8NjaXi0FDwDiuF9V4tlxMb/ytm6PJr2/vG459GuGXyRtEwftpi1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5ECBC4CEC5;
	Tue, 17 Sep 2024 22:45:24 +0000 (UTC)
Date: Tue, 17 Sep 2024 18:45:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH v2 0/7] linux-kbuild: fix: process configs set to "y"
Message-ID: <20240917184520.6acdf00b@rorschach.local.home>
In-Reply-To: <CAK7LNATbgLrU07dZe+30jzUuP-A1KRfPY8=E2hP9W-Rvzsfg8Q@mail.gmail.com>
References: <20240916142939.754911-1-david.hunter.linux@gmail.com>
	<CAK7LNATbgLrU07dZe+30jzUuP-A1KRfPY8=E2hP9W-Rvzsfg8Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Sep 2024 23:45:36 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> (+CC: Steven Rostedt, the author of this script)
> 

Since my Out of Office message only goes to people who email me, and
this was basically just adding me to someone else's email, I'll reply
here to say I'm currently helping to running Linux Plumbers, and next
week I'll be at Kernel Recipes. My inbox will be very full when I get
back home and will likely not see this email again for a month or two.

If you want me to take a look, please ping me again sometime after
September 30th.

-- Steve

