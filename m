Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7CB43DAB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 07:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhJ1FTZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 01:19:25 -0400
Received: from codesynthesis.com ([188.40.148.39]:34612 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhJ1FTY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 01:19:24 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id AD76D5FBE9;
        Thu, 28 Oct 2021 05:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1635398216;
        bh=duNsbXBzb5S2u6T9540WscdZ5X3p76t1aJzInAnkIVg=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=wd29czSqQhEUkmKiFyvap1Z0lrHQ2Xkt5WBi5tQH2Y3nlyLrRbBmDE5IcK9TG8P/V
         O3uJOhdEbPGJUQHKbNgNAaf1fDitywgqihLzReYIVriUpKvrasJQ3MsvON18paQzoK
         ee9RdffsNRj17s4s1JV49sXOCNq9ikOFQwLi+o1Y/it3C2Tk6/bocBj3J6QQUqwISG
         hgoOTHNQJydJ+OTWc0yZBVvW/Dbg4mdoWT+uKvMkFDRBra7AaKKegHFWHa+7PGcdIs
         Ubb4d8H+DHEemxkiku0QijjpS6iAHYEz1RbtBxm0V99j4mpuztPPOYBrTOLh8wXhL3
         bAvIbcjABbX+w==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 1A4D81A800C4; Thu, 28 Oct 2021 07:16:53 +0200 (SAST)
Date:   Thu, 28 Oct 2021 07:16:53 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] kconfig: refactor conf_write_symbol()
Message-ID: <boris.20211028071331@codesynthesis.com>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
 <20211001053253.1223316-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001053253.1223316-3-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> +static void __print_symbol(FILE *fp, struct symbol *sym, enum output_n output_n,

Identifier that start with double underscore are reserved. The same
goes for __conf_write_autoconf() in another patch.
