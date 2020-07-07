Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B0B216E7C
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 16:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgGGORJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 10:17:09 -0400
Received: from mout.web.de ([212.227.17.11]:44609 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728029AbgGGORI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 10:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1594131405;
        bh=4JdaZyW4XnKhmRNsg/2UnDWvuX7SbPOd4rNp8QOv7MM=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=nuY8fGDnKw68SVMA8fn7b1GrnIBAUoLTGb0/0uajhQ+jwbP+WISYze+r4zr/ucSai
         dv4oCZFEcAZRN+0Stza1F74lyULXxbx6XEj4lbL5YUfUZHohpASigNIz6o0u9zgv1S
         zM6ADu96X36I6NH9lgcc+FmIdxxrXXlhKbMcbn2U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.121.241]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M1X9B-1km1Nl3IN7-00tUL2; Tue, 07
 Jul 2020 16:16:44 +0200
Subject: =?UTF-8?Q?Re=3a_kbuild=3a_Improve_descriptions_for_the_make_paramet?=
 =?UTF-8?B?ZXIg4oCcQ+KAnQ==?=
From:   Markus Elfring <Markus.Elfring@web.de>
To:     linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Coccinelle <cocci@systeme.lip6.fr>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Randy Dunlap <rdunlap@infradead.org>
References: <e546930c-0022-c0ea-059f-0c5ec782b5ab@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f4012005-ade5-5c2f-c9b2-4c93fbc6b835@web.de>
Date:   Tue, 7 Jul 2020 16:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e546930c-0022-c0ea-059f-0c5ec782b5ab@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tY/ejK24Vcdya0Z43R2Zj6BHSFGpzO/6RraarHT2XPuKFejLwJr
 eNRcHsrFfLXpvD+M3NvlAGIa5x7Ute3IKV0ZWjge069FvwEKAOXqydL6KlvGpTgZ6n+32Di
 YFUavtAO7Ztjb6wvZVncoL+bkaVLDYyLCfCcRSy/3CGbPW6ha/wbrvJCc8RK1A3z1N3/CWG
 t3C3Mu5IdzKVGgEPp2D/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lT/1zCe3j2Q=:pE2fm4FGM1/hVFLZ3MUrM0
 0pBJqBCOoSkSw3+POrdqFkJQDqZnKY4QeofaYLc0RPmjtnt5VlaFlkNHm4bLWyHKQptSgDOOO
 IimuFCVzoZHi55G5eH7f5OJHNdKzCC8I9QDs9VjlgSgdb33qeB709w3nKwUzcT0QIh4wkr3UP
 hSRfiFod/mVF+JZ/v6/zlOSVeMmmyaBcG175aEeFNw3xLYQE9RrbEUEjbY4CmRTKvVKTy+Kq4
 Uk45zI0BibP7oqXylY4aXvSFD27JhVL197eX3/lMbenT5fYcis78O/GsKLnf4bvo3YcrMESO3
 +49VEcUfc+epxsvdT2KjVoF3ZQwCNMOsr5qLGtN6R/aXbS3MTYzLlHNAHivyaeXn5lQChDb7I
 a9U8UHCiZx+3fwT82YMUnMltpZyE3oQllhpO+AHfquEG+3p+letc6j1fFSDyqFF4GxK5+JygE
 0P/dBYUVN2Mfkwp+4HWWyCJlFo/w+FjBYn4bvDSjwr3n0oujEUSz8ozNEmAdppUlOenatRodZ
 dSn75GcPsouzqHKRVYtSI811d/XDX/qzon/LWZLwVDX2T4gN0UFakl0CWNeimlEr1DJtTsgQL
 D5UJom8xQeLCRe/xpOd8oHx21fQtvPKdCppEryhjN2THAHPY3N0uUI+rm2rKmQ4DVbdcXrK8c
 7FhZIIaO1vUhCSioLMpR5T4p3pYbZ17uHi1kAp7m/OneeQMBvVWf8TO/6C37FK+mngDBNs9jX
 5SyEQfW69mhdOxqLfYBzxQ2sa/0eV0aYsFpM+H2dkB2rC+MshLrKrcQIdAJcN9wfwTra4ky6G
 4/4F0Ea2hoewHjsAiobo+qOWcSyTShOSZLfLrODGlQ+Wumg/+ARvWIO6YErQ8FT6Kh+mNtI/r
 wau8PlYUqw5DTx6zYcZJ97VXD+Z11Y2XWggL1vuc4+cmQ6SUGHTk9k2DIL/wfY+6YixIG10q1
 XOIcnPPbPNg0AXs3WRUmfitg6CX2eNwrpfiuUgQv624RdJXjEEXl7FeL2lTS9T8R8lEbnnID6
 kMHfPiqdNU0owHJiANa+F0NrXc1hvXoMGIEmp645GJ4v5FWl9O/vdXSeYItHLli+0MWdmcS3n
 q6+Uj+YN/mbUtKVi7fLikIZbZZBXrJ7BlcqOeDq8wuU3z8wu/s9K5+yMLULTRxie0RuXA3l7d
 wPYZZ6PiQmrJQAtQjOT9aoo5nPy/UC2bo56MpQjtHuj23y72G/qBEBkKzkPhmX7fAs23Pnxhu
 zhAWXU7y8hz+XR+7vh9ibRkna1PzSTdtP1NTueg==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Makefile?id=3Dcdd3bb54332f82295ed90cd0c09c78cd0c0ee822#n201
>
> =E2=80=9C=E2=80=A6
> # Use 'make C=3D1' to enable checking of only re-compiled files.
> # Use 'make C=3D2' to enable checking of *all* source files, regardless
> # of whether they are re-compiled or not.
> =E2=80=A6=E2=80=9D

I got the impression that source files would be checked according to
such build parameters before a corresponding compilation try.
How do you think about to adjust descriptions which were added with
the commit 1c7bafe7206d928eaccbcbd08d868733e0fb7054 ("kbuild: clarify
"make C=3D" build option")?
https://lkml.org/lkml/2006/9/24/176
https://lore.kernel.org/patchwork/patch/65119/
https://lore.kernel.org/lkml/115913270694-git-send-email-sam@ravnborg.org/

Regards,
Markus
