Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16352DFCBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 15:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLUOXk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 09:23:40 -0500
Received: from codesynthesis.com ([188.40.148.39]:41524 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgLUOXj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 09:23:39 -0500
Received: from brak.codesynthesis.com (unknown [102.68.73.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 6E9AB5EFBA;
        Mon, 21 Dec 2020 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1608560577;
        bh=8PpVFaUjaHs2MJm3jQ7t5c/TtRcoscdZ1xfcf5mbWoI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=nIfTDFuuwtvrwlLI0gRUtYqIBv7ctWlG2OthJd0nkphVG5ftuWGLu1LfT9pzl+HAh
         8cTAOpXQhKB7sr42uVeMzSARbE8P1058fG4fT1z9mXbov7nMthr3w70soD4rYq8igb
         6SY50eMg/0PgiQNVi3WHVNxgZfiyKbyGyELZmAmyMc+CuDdUBdSO0x0Mh5Dh0u7TmA
         FNkrVt7VmzyTMqcah+tz0Y7xP3iU3TI7BOl0QeCboqSE/O1O9jFM4ZHNw5j98bYzvi
         tCLfJ6pnTku4Ec2nqnY/Ruawp8U/CB2fIJYLpU1whEzp1Xs2gFnoFZT6D+lhljoW19
         qWVGgtIGhxJIQ==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 16D3E1A800C4; Mon, 21 Dec 2020 16:22:53 +0200 (SAST)
Date:   Mon, 21 Dec 2020 16:22:53 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: drop filename and line number prefix from
 warning/error-if macros
Message-ID: <boris.20201221161803@codesynthesis.com>
References: <20201221094650.283511-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221094650.283511-1-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[Copying some of my comments from another reply.]

Masahiro Yamada <masahiroy@kernel.org> writes:

> When I implemented the Kconfig macro language, I took the GNU Make
> behavior as a reference in general, but I did not follow the message
> format of $(error ...) to avoid that annoyance.
> 
> So, the following code in Kconfig:
> 
>   $(warning-if,y,This is the first line)
>   $(warning-if,y,This is the second line)
>   $(error-if,y,This is the last line)
> 
> ... will print the messages in a consistent format:
> 
>   Kconfig:1: This is the first line
>   Kconfig:2: This is the second line
>   Kconfig:3: This is the last line

IMO, there is a flaw with this approach: there is no way for the
user to know that these three lines are about the same error.

If we want this ability, then let's find a way do it properly
rather than spreading further hacks. For example, in the build
system I am working on, we have suport for multi-line diagnostics
records that to the user look like this:

Makefile:3: error: This is the first line
  This is the second line
  This is the last line


> But, in hindsight, the built-in functions should have only primitive
> functionality to print the given message without any prefix. The lesson
> I learned from GNU Make was such a prefix is easy to add, difficult to
> remove.
> 
> This commit changes the built-in functions, warning-if and error-if, to
> not print the file name or the line number.

Wouldn't automatically showing the position in the Kconfig file
where the error/warning has originated be much, much more useful
than the occasional need to print multi-line messages?
