Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1158313FA06
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2020 20:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgAPTw5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 14:52:57 -0500
Received: from ms.lwn.net ([45.79.88.28]:44586 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729565AbgAPTw4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 14:52:56 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 24C8A1E5;
        Thu, 16 Jan 2020 19:52:56 +0000 (UTC)
Date:   Thu, 16 Jan 2020 12:52:55 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] kconfig: fix documentation typos
Message-ID: <20200116125255.56eba406@lwn.net>
In-Reply-To: <20200113232212.138327-1-helgaas@kernel.org>
References: <20200113232212.138327-1-helgaas@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 13 Jan 2020 17:22:11 -0600
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix a couple typos in kconfig-language documentation.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Looks good to me; Masahiro I assume you'll be taking this one?

Thanks,

jon
