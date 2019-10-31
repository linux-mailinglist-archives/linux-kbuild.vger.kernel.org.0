Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049E2EB562
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 17:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfJaQvy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Oct 2019 12:51:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22556 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728614AbfJaQvy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 12:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572540712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Eg9oWuOPqo1L+W4rD3h5PNuEgEsQhGB7UKbPvjWbL1s=;
        b=P8+lQfeQ7cTDv/q1DrVF0wUF6/IfvVHW50Y5/VFOmJIEb2cotuHiAj4a7ui2btFO46Kxxp
        FOmss1EgPGaR8achhbIOrpQWVlj1H3zx4VA6koMchycJ7F96Z4PAcaZCmQ/kxK1ZnSGWIt
        k6RfhhwaaTTy2D6806CVlsG4d9dwd+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-SFOVO5HhMI-DJYYvgzKgZA-1; Thu, 31 Oct 2019 12:51:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AD8D107ACC0;
        Thu, 31 Oct 2019 16:51:47 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com (segfault.boston.devel.redhat.com [10.19.60.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AC541001B07;
        Thu, 31 Oct 2019 16:51:46 +0000 (UTC)
From:   Jeff Moyer <jmoyer@redhat.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
        linux-nvdimm@lists.01.org
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
        <20191003102915.28301-4-yamada.masahiro@socionext.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date:   Thu, 31 Oct 2019 12:51:45 -0400
In-Reply-To: <20191003102915.28301-4-yamada.masahiro@socionext.com> (Masahiro
        Yamada's message of "Thu, 3 Oct 2019 19:29:15 +0900")
Message-ID: <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: SFOVO5HhMI-DJYYvgzKgZA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Now that there is no overwrap between symbols from ELF files and
> ones from Module.symvers.
>
> So, the 'exported twice' warning should be reported irrespective
> of where the symbol in question came from. Only the exceptional case
> is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> typically occurs for EXPORT_SYMBOL in .S files.

Hi, Masahiro,

After apply this patch, I get the following modpost warnings when doing:

$ make M=3Dtools/tesing/nvdimm
...
  Building modules, stage 2.
  MODPOST 12 modules
WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported twice. =
Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock' exported twice=
. Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked' exported tw=
ice. Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap' exported tw=
ice. Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Pr=
evious export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previ=
ous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev' exported twice=
. Previous export was in drivers/nvdimm/libnvdimm.ko
...

There are a lot of these warnings.  :)  If I revert this patch, no
complaints.

Cheers,
Jeff


>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/modpost.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5234555cf550..6ca38d10efc5 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2457,7 +2457,6 @@ static void read_dump(const char *fname, unsigned i=
nt kernel)
>  =09=09s =3D sym_add_exported(symname, namespace, mod,
>  =09=09=09=09     export_no(export));
>  =09=09s->kernel    =3D kernel;
> -=09=09s->preloaded =3D 1;
>  =09=09s->is_static =3D 0;
>  =09=09sym_update_crc(symname, mod, crc, export_no(export));
>  =09}

