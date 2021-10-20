Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DC6434B21
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 14:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhJTM1q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 08:27:46 -0400
Received: from codesynthesis.com ([188.40.148.39]:41732 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhJTM1q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 08:27:46 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 72DCF5FBE9;
        Wed, 20 Oct 2021 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1634732730;
        bh=SiFKU7vJKyd6yR3VxazeA6uyqQ1djiWR4/XyHOx7+PQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=pXYmFlQDIAu0VjLqxdtUQPnMXq23EyLo27qxeOkNRQ/AeRcLFk8fCIkEl6f670lIP
         JG+iMPgAsYgfrUdYpSKIpZ3nWkFVyZD+Lx5PjrSBHk8pfNcke/mLCfBpNYLygkgMND
         29Jsj5ZcQUMdKju/skNDV1Y1AdRksFTJPRrvMiejNikilszZ6aEMyc6HlLR89NkFif
         D+QAi29tUsvvyodgIXYkL7BsvnJyFWBcDXezpTmZht9DlBut02wKPLPFaiizU9njFb
         ddmYfHt3m/10YEkBe3HVSxC2IvFUf5o1wmR2FCaYmGbcZ2zXrmCtM+M0g6xM0qweJL
         +1KYvHAEv6Xig==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 9996E1A800C4; Wed, 20 Oct 2021 14:25:24 +0200 (SAST)
Date:   Wed, 20 Oct 2021 14:25:24 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [RFC 0/3] kconfig: add support for conflict resolution
Message-ID: <boris.20211020141745@codesynthesis.com>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thorsten Berger <thorsten.berger@rub.de> writes:

> New UI extensions are made to xconfig with panes and buttons to allow users
> to express new desired target options, calculate fixes, and apply any of
> found solutions.
>
> [...]
>
> You can see a YouTube video demonstrating this work [2].

While the demo looks impressive, I wonder if you ran into many cases
where the number of solution and/or the number of fixes in a solution
is large (and therefore would be hard for a human to make a decision
about)?

My closest experience with something like this is aptitude and the
few times I tried to use it to solve package dependency issues were
futile because of that (i.e., large number of alternative solutions
and large number of changes in each solution).
