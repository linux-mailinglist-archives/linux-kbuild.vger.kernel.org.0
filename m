Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E02DF18AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 15:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731940AbfKFOeL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 09:34:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22039 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731935AbfKFOeL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 09:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573050850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GuEqvoKpnhY6ya78PGmgiZL+8devT6u4gdgAYEGLPDg=;
        b=VIA55X3EtOyt71OlvKhRZRq1C7nctMBIlNDroOKKCutgJtgiGzykDzT/ZJ13mlvNizP5Zc
        ss89/+N1QpvWiw6UAbp6uwxzL0ep9KDt/IdO97ZLA2buUJHrCO5su9qTtFTH/QqWE146qA
        lt0iigbh56u4T90W7GTbIwP/+Xx5tII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-1PeyxA2-PYqpmjo5-mRw7Q-1; Wed, 06 Nov 2019 09:34:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F26477;
        Wed,  6 Nov 2019 14:34:05 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com (unknown [10.19.60.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E9DE85D70D;
        Wed,  6 Nov 2019 14:34:03 +0000 (UTC)
From:   Jeff Moyer <jmoyer@redhat.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Vishal Verma <vishal.l.verma@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] modpost: add an option to suppress 'exported twice' warnings
References: <20191106112357.29053-1-yamada.masahiro@socionext.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date:   Wed, 06 Nov 2019 09:34:02 -0500
In-Reply-To: <20191106112357.29053-1-yamada.masahiro@socionext.com> (Masahiro
        Yamada's message of "Wed, 6 Nov 2019 20:23:57 +0900")
Message-ID: <x49d0e5nkf9.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 1PeyxA2-PYqpmjo5-mRw7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Since commit "modpost: do not set ->preloaded for symbols from
> Module.symvers", the modpost always warns about symbols exported
> multiple times.
>
> Generally, I believe it is a good thing to show a warning when the
> same symbol name is exported twice. This avoids the accidental symbol
> conflict.
>
> However, in some cases, we build an external module to provide a
> different version/variant of the in-kernel module, overriding the
> same set of exported symbols.
>
> At least, there is one use-case in the upstream code;
> tools/testing/nvdimm/libnvdimm.ko replaces drivers/nvdimm/libnvdimm.ko
> in order to link it against mocked version of core kernel symbols.
>
> Now, this emits a lots of 'exported twice' warnings:
>
>   https://lkml.org/lkml/2019/10/31/627
>
> To suppress those, add a new option KBUILD_DUPLICATED_EXPORTS_NO_WARN.
>
> If you intentionally override the existing symbols, you can pass it
> from the command line:
>
>   make M=3Dtools/testing/nvdimm KBUILD_DUPLICATED_EXPORTS_NO_WARN=3D1
>
> Or, more conveniently, you can add it to the module Makefile, so
> you can still do:
>
>   make M=3Dtools/testing/nvdimm
>
> without sprinkling the warnings.
>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Jeff Moyer,
> Dan Williams,
>
> Please check if this patch solves the nvdimm build issue.

Yep, that fixes it for me.

You can add:

Tested-by: Jeff Moyer <jmoyer@redhat.com>

Thanks!

