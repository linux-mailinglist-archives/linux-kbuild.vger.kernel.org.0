Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1C7258B57
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 11:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgIAJTy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Sep 2020 05:19:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbgIAJTy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Sep 2020 05:19:54 -0400
Received: from gaia (unknown [46.69.195.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7DF820FC3;
        Tue,  1 Sep 2020 09:19:51 +0000 (UTC)
Date:   Tue, 1 Sep 2020 10:19:49 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Greentime Hu <green.hu@gmail.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nick Hu <nickhu@andestech.com>,
        Paul Mackerras <paulus@samba.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] arch: vdso: add vdso linker script to 'targets' instead
 of extra-y
Message-ID: <20200901091948.GF5561@gaia>
References: <20200831182239.480317-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831182239.480317-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 01, 2020 at 03:22:39AM +0900, Masahiro Yamada wrote:
> The vdso linker script is preprocessed on demand.
> Adding it to 'targets' is enough to include the .cmd file.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
