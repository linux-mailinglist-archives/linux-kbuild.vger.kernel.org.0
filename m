Return-Path: <linux-kbuild+bounces-36-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF47EE0AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 13:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37148280F99
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B038441F;
	Thu, 16 Nov 2023 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codesynthesis.com header.i=@codesynthesis.com header.b="ERgrdYPG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from codesynthesis.com (codesynthesis.com [188.40.148.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C007E1A5;
	Thu, 16 Nov 2023 04:28:58 -0800 (PST)
Received: from brak.codesynthesis.com (unknown [105.186.92.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by codesynthesis.com (Postfix) with ESMTPSA id DBBED60B62;
	Thu, 16 Nov 2023 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
	s=mail1; t=1700137737;
	bh=L8/2LumOofn84zXo/hfXIiuePhx2MJbJ78D9E/u+btg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:From;
	b=ERgrdYPGWBEfLSc7qvrMU5juoz3+g0RVHUNxX2DP6FtG8RIdyzAabyWzF7RAnseLg
	 93y6YMDpDr/EGrlOHVt0rzAvhIB8n3Ul53QT87WX/z0i9kaWn7aU8dTgDy3rdJoa/J
	 6dQDjHp6EZdwp0LXZbr7fCawWp+6Fbg/GWc/oMGhS7FGxFziP8oScx7KAATZXbByjY
	 9ClU96Li8prdToTs+nr9tuXQsaq0kDFHJPTcukHvBg85R1Cfzk4Ag8uo2iBCGmdrGl
	 esd5oHhNCvAJNmlKT1anEwXtnRthHAi4EwpaHpXcZ4QXgaAJU/Pi7kibd9GnLoB5yj
	 0kI3DJUkhqLaA==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
	id DC290146149; Thu, 16 Nov 2023 14:28:57 +0200 (SAST)
Date: Thu, 16 Nov 2023 14:28:57 +0200
From: Boris Kolpackov <boris@codesynthesis.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: fix memory leak from range properties
Message-ID: <boris.20231116141906@codesynthesis.com>
References: <20231115041653.810045-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115041653.810045-1-masahiroy@kernel.org>
Organization: Code Synthesis

Masahiro Yamada <masahiroy@kernel.org> writes:

> Currently, sym_validate_range() duplicates the range string using
> xstrdup(), which is overwritten by a subsequent sym_calc_value() call.
> It results in a memory leak.
> 
> [After]
> 
>   LEAK SUMMARY:
>      definitely lost: 0 bytes in 0 blocks
>      indirectly lost: 0 bytes in 0 blocks
>        possibly lost: 0 bytes in 0 blocks
>      still reachable: 17,462 bytes in 20 blocks
>           suppressed: 0 bytes in 0 blocks

FYI, there are quite a few other memory leaks in Kconfig (as evident from
the still reachable value in the above report). I believe I've fixed most
of them in this commit:

https://github.com/build2-packaging/kconfig/commit/cd9910e3636515b2980ce1d37d1984ccfd6b4cb9

In particular, I could load the Linux kernel configuration repeatedly
in a loop without causing any memory leaks or crashes (which were common
due to the state not being reset properly).

I believe the above commit also includes a fix for the sym_validate_range()
leak in question, though the way it's fixed is different. The potential
problem with the proposed fix is that it may be impossible to decide who
should free the shared value.

