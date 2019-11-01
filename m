Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E95EEC8A8
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2019 19:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfKASwf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Nov 2019 14:52:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47041 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727372AbfKASwf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 14:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572634354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7vllCCVrOpmYyfvb9Xg8yUmypgDAYnIAfaIkWG13YkI=;
        b=BLlFl4qx6Ixre0EKnfeNJIBu7wsJSZKr2kIFaIsoec54sa4jerr8MEs5BYYLQmz5CnJxK4
        6+56IIMdGIDyKrpT0QsywLeCeZc/h/Ebrs3xpVIjRtSBCtZyOjqIqkT5xq/lpAibo0OrG7
        MZewOSTBMMVy+cIWFkIGYX0o5j20dK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-5oo6zwAIOUexO0zYswBGLw-1; Fri, 01 Nov 2019 14:52:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D04681005500;
        Fri,  1 Nov 2019 18:52:29 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com (segfault.boston.devel.redhat.com [10.19.60.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E9F4600D1;
        Fri,  1 Nov 2019 18:52:28 +0000 (UTC)
From:   Jeff Moyer <jmoyer@redhat.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
        <20191003102915.28301-4-yamada.masahiro@socionext.com>
        <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
        <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date:   Fri, 01 Nov 2019 14:52:27 -0400
In-Reply-To: <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
        (Masahiro Yamada's message of "Fri, 1 Nov 2019 10:13:10 +0900")
Message-ID: <x494kznctuc.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5oo6zwAIOUexO0zYswBGLw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>>
>> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>
>> > Now that there is no overwrap between symbols from ELF files and
>> > ones from Module.symvers.
>> >
>> > So, the 'exported twice' warning should be reported irrespective
>> > of where the symbol in question came from. Only the exceptional case
>> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
>> > typically occurs for EXPORT_SYMBOL in .S files.
>>
>> Hi, Masahiro,
>>
>> After apply this patch, I get the following modpost warnings when doing:
>>
>> $ make M=3Dtools/tesing/nvdimm
>> ...
>>   Building modules, stage 2.
>>   MODPOST 12 modules
>> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported
>> twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice.=
 Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Pr=
evious export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> ...
>>
>> There are a lot of these warnings.  :)
>
> These warnings are correct since
> drivers/nvdimm/Makefile and
> tools/testing/nvdimm/Kbuild
> compile the same files.

Yeah, but that's by design.  Is there a way to silence these warnings?

-Jeff

