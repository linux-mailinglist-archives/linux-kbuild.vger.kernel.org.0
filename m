Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56542419679
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Sep 2021 16:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbhI0OgI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Sep 2021 10:36:08 -0400
Received: from codesynthesis.com ([188.40.148.39]:48670 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234816AbhI0OgG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Sep 2021 10:36:06 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 52D8660394;
        Mon, 27 Sep 2021 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1632753267;
        bh=p/ihu8msFz+EyYA+lzoyRImdv9Ww85GzPMhVGKFYUOY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=kjKFhs7ZGVIogd7UMSNjynLfZALTbKfroTp7SWwYsTPudidXwUZ6ttURTYlD1DY+z
         EMppxwZCdWTfoYWvVWmb1cmIW11Zk8u8vDjHtcdBIaet2XqSJvyYAO2gOR47eD/BxB
         1kJKAnCPbMoBMmh0pYveKFGXrHMcD8MAik3ZoTBsvQjIWj7VBC0Z5eUFM02WnpYm19
         PzfxiGzQNv5Knx5woXm8ColX8BD6wvRpgnJNpdHJwDmUt+h11m0TQOVbtXtYp8Z9kz
         9J0XQKikP9DV8FtAid9pYcoB1tpt7MA1NycChg+PpIIa/XMJIiEOMCGKKVQiGY7Deq
         grZuS9skcJy3A==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id B40DE1A800C4; Mon, 27 Sep 2021 16:34:22 +0200 (SAST)
Date:   Mon, 27 Sep 2021 16:34:22 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Richard Weinberger <richard@nod.at>
Cc:     masahiroy <masahiroy@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] kconfig: Deny command substitution in string values
Message-ID: <boris.20210927162833@codesynthesis.com>
References: <20210920213957.1064-1-richard@nod.at>
 <20210920213957.1064-2-richard@nod.at>
 <boris.20210922090732@codesynthesis.com>
 <1402570794.96583.1632295660867.JavaMail.zimbra@nod.at>
 <boris.20210922165140@codesynthesis.com>
 <1942256037.97524.1632327460626.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1942256037.97524.1632327460626.JavaMail.zimbra@nod.at>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Richard Weinberger <richard@nod.at> writes:

> Yes. auto.conf is .config post processed.
> This is exactly where my mitigation takes place.

No, sym_escape_string_value() is called by conf_write_symbol()
which in turn is called from conf_write() and conf_write_defconfig()
(used to write .config files) besides conf_write_autoconf() (used to
write auto.conf).
