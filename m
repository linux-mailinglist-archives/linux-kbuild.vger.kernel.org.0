Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1739E2630AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Sep 2020 17:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730294AbgIIPiA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Sep 2020 11:38:00 -0400
Received: from codesynthesis.com ([142.44.161.217]:34024 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730374AbgIIPhj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Sep 2020 11:37:39 -0400
Received: from brak.codesynthesis.com (unknown [105.226.107.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 851435F138;
        Wed,  9 Sep 2020 14:09:48 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 9751F1A800C4; Wed,  9 Sep 2020 16:09:43 +0200 (SAST)
Date:   Wed, 9 Sep 2020 16:09:43 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: fix incomplete type 'struct gstr' warning
Message-ID: <boris.20200909155725@codesynthesis.com>
References: <20200908221638.2782778-1-masahiroy@kernel.org>
 <20200908221638.2782778-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908221638.2782778-2-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> Currently, get_relations_str() is declared before the struct gstr
> definition.

Yes, I also ran into this while building the kconfig code with MSVC.
I just moved the struct gstr definition before lkc_proto.h #include
but your fix works just as well.

Acked-by: Boris Kolpackov <boris@codesynthesis.com>


> BTW, some are declared in lkc.h and some in lkc_proto.h, but the
> difference is unclear. I guess some refactoring is needed.

Yes, please. My (potentially incorrect) understanding is that lkc_proto.h
was for functions that are not (or should not be) used by clients but
should nevertheless have prototypes due to -Wmissing-prototypes. I,
however, believe this no longer holds and so would vote to merge
lkc_proto.h into lkc.h.
