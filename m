Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9627C29EE8E
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 15:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgJ2Omq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 10:42:46 -0400
Received: from codesynthesis.com ([142.44.161.217]:46424 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbgJ2Omh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 10:42:37 -0400
X-Greylist: delayed 621 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Oct 2020 10:42:36 EDT
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id A7B225F6C2;
        Thu, 29 Oct 2020 14:32:14 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 952C71A800C4; Thu, 29 Oct 2020 16:32:07 +0200 (SAST)
Date:   Thu, 29 Oct 2020 16:32:07 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kconfig: qconf: convert to Qt5 new signal/slot
 connection syntax
Message-ID: <boris.20201029163103@codesynthesis.com>
References: <20201024123841.1201922-1-masahiroy@kernel.org>
 <20201024123841.1201922-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201024123841.1201922-3-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> Now that the Qt4 support was dropped, we can use the new connection
> syntax supported by Qt5. It provides compile-time checking of the
> validity of the connection.
> 
> Previously, the connection between signals and slots were checked
> only run-time.
> 
> Commit d85de3399f97 ("kconfig: qconf: fix signal connection to invalid
> slots") fixed wrong slots.
> 
> This change makes it possible to catch such mistakes easily.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Boris Kolpackov <boris@codesynthesis.com>
