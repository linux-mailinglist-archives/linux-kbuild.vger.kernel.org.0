Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4537C3BAF20
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhGDVIO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhGDVIO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:08:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B89C061574;
        Sun,  4 Jul 2021 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1eUr+gbecB5vZp8b6uWu5kOh4miZGULdLwL3OofYB+o=; b=EvCMmD0n/QDhfPrCw3JMAOyG7x
        dydQUiG8qbs24YHnT9qafnQX0MePXUhawlwRJmI8Jpwsa9QuEyHS8mlkA4vXoPi1E24UKQvgLhVBS
        a5peUvgVTQaDYgxskZl+gKBdezwoce9W6Tki4euisOg9PllOipt/HV3qs51TcPCISgxKG4SF9SBFE
        QStujndr8c5gI2i9ZGX8mJ6O0c/KmDh7ErxxoKVviMrKMGbs78rOXKfkV6vlpsYurk85oSYZrRue9
        CfZrVVAUMDfQdqEWCcRSbsMDQUjEuca6i6hT1Lsa/M4esFCCL+VBAjZ7FTM0LJy3t+kdlha/wv+F0
        02Bh61eg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m09IH-009b56-3Y; Sun, 04 Jul 2021 21:04:52 +0000
Date:   Sun, 4 Jul 2021 22:04:49 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <YOIicc94zvSjrKfe@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-2-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-2-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 10:27:40PM +0200, ojeda@kernel.org wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> Rust symbols can become quite long due to namespacing introduced
> by modules, types, traits, generics, etc.
> 
> Increasing to 255 is not enough in some cases, and therefore
> we need to introduce 2-byte lengths to the symbol table. We call
> these "big" symbols.
> 
> In order to avoid increasing all lengths to 2 bytes (since most
> of them only require 1 byte, including many Rust ones), we use
> length zero to mark "big" symbols in the table.

What happened to my suggestion from last time of encoding symbols < 128
as 0-127 and symbols larger than that as (data[0] - 128) * 256 +
data[1]) ?
