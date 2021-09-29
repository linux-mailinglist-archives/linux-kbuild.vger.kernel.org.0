Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B6141C63E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Sep 2021 16:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244965AbhI2ODf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 10:03:35 -0400
Received: from codesynthesis.com ([188.40.148.39]:60556 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235324AbhI2ODe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 10:03:34 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 59B006034F;
        Wed, 29 Sep 2021 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1632924112;
        bh=Z+OEKtbxovOrH0YtiK7ebFEQZ9u9CA6/TnGWji7eu1s=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=diMRE4c+HrA0+ROMwPMetBbloH2B0zIi7vfKoVeSVt7sNiuxE4A3ul4QzOmcJ0Pge
         3PbjJKKxxf+mHkIbAhhuQF7cx/kmuSkjxB5jhSx6MWI5HA4j75F7afy5fa4R1r1NTW
         lqIDVnC9QxPKEaEBQHBcCRUZzwGMeqyFnkSN05xus5MvstF7cxD/6cr4up9wtKwK1B
         geRtJpEfJGippfq+VUq9+tZgn4D2rkqCNa+QpmYhA9Ql9gqBgACZcfdQYMqDj5hWbg
         DObm70VmK5cXE5EYhQTiNnzjnreKdpRPUUPZfz2gLq8ITgtOLPwouPNJeRcAJ4ZE9i
         xz+Iq8CWRHsFQ==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 2DB661A800C4; Wed, 29 Sep 2021 16:01:48 +0200 (SAST)
Date:   Wed, 29 Sep 2021 16:01:48 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: rename a variable in the lexer to a clearer
 name
Message-ID: <boris.20210929160100@codesynthesis.com>
References: <20210927125437.818092-1-masahiroy@kernel.org>
 <20210927125437.818092-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927125437.818092-2-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> In Kconfig, like Python, you can enclose a string by double-quotes or
> single-quotes. So, both "foo" and 'foo' are allowed.
> 
> The variable, "str", is used to remember whether the string started with
> a double-quote or a single-quote.
> 
> Rename it to a clearer name. The type should be 'char'.

LGTM.

Reviewed-by: Boris Kolpackov <boris@codesynthesis.com>
