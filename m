Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 200D5F8B9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2019 14:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfD3MXE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Apr 2019 08:23:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:48084 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbfD3MXE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 08:23:04 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3ADA79AF;
        Tue, 30 Apr 2019 12:23:03 +0000 (UTC)
Date:   Tue, 30 Apr 2019 06:23:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] dontdiff: update with Kconfig build artifacts
Message-ID: <20190430062300.7c9cf177@lwn.net>
In-Reply-To: <1556549630-17605-1-git-send-email-yamada.masahiro@socionext.com>
References: <1556549630-17605-1-git-send-email-yamada.masahiro@socionext.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 29 Apr 2019 23:53:50 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Add generated *conf-cfg files.
> 
> Commit 694c49a7c01c ("kconfig: drop localization support") removed
> "gconf.glade.h" and "kxgettext".
> 
> "kconfig" and "lxdialog" should not be excluded either.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied, thanks.

jon
