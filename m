Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03968289D56
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Oct 2020 04:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgJJBpJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 21:45:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729390AbgJJBG4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 21:06:56 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 348A52076E;
        Sat, 10 Oct 2020 01:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602292000;
        bh=1GQZoxkKDcODDvQVtci6zcphjEBRdQeWqn9ZvswDQas=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NwJHmxyzOPGH60Ie9ztyQykx4u8a8e5STiuhiiyD83jgtn6PQ4blwYuQOzrhyjPGU
         ujaRkqJNkUiHFjJgwwB9ru6yKgBffeENkrjWXJOaHQ4Mh6Cbd8ATbvCAX7UV5oFjNe
         yHZlnSz6froJx2tN6vo44HS4PJFOuPLhqC0MKt7w=
Date:   Fri, 9 Oct 2020 18:06:38 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jacob Keller <jacob.e.keller@intel.com>
Cc:     <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] scripts: remove namespace.pl
Message-ID: <20201009180638.2a2950a5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201010001844.2925318-1-jacob.e.keller@intel.com>
References: <20201010001844.2925318-1-jacob.e.keller@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri,  9 Oct 2020 17:18:44 -0700 Jacob Keller wrote:
> namespace.pl is intended to help locate symbols which are defined but
> are not used externally. The goal is to avoid bloat of the namespace in
> the resulting kernel image.
> 
> The script relies on object data, and only finds unused symbols for the
> configuration used to generate that object data. This results in a lot
> of false positive warnings such as symbols only used by a single
> architecture, or symbols which are used externally only under certain
> configurations.
> 
> Running namespace.pl using allyesconfig, allmodconfig, and
> x86_64_defconfig yields the following results:
> 
> * allmodconfig
>   * 11122 unique symbol names with no external reference
>   * 1194 symbols listed as multiply defined
>   * 214 symbols it can't resolve
> * allyesconfig
>   * 10997 unique symbol names with no external reference
>   * 1194 symbols listed as multiply defined
>   * 214 symbols it can't resolve
> * x86_64_defconfig
>   * 5757 unique symbol names with no external reference
>   * 528 symbols listed as multiply defined
>   * 154 symbols it can't resolve
> 
> The script also has no way to easily limit the scope of the checks to
> a given subset of the kernel, such as only checking for symbols defined
> within a module or subsystem.
> 
> Discussion on public mailing lists seems to indicate that many view the
> tool output as suspect or not very useful (see discussions at [1] and
> [2] for further context).

Acked-by: Jakub Kicinski <kuba@kernel.org>

Thanks!
