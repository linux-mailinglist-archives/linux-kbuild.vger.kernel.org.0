Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA0A112FD40
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 20:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbgACTwI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 14:52:08 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:60212 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbgACTwI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 14:52:08 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C48DF20026;
        Fri,  3 Jan 2020 20:52:06 +0100 (CET)
Date:   Fri, 3 Jan 2020 20:52:05 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/12] initramfs: refactor the initramfs build rules
Message-ID: <20200103195205.GC21515@ravnborg.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
 <20200103175915.26663-12-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103175915.26663-12-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=WVVD8NIdMxo9nYlgdXoA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Mashahiro.

I just browsed this fine patchset and noticed...
>  
> -#####
> -# Generate the initramfs cpio archive
> +ramfs-input := $(shell echo $(CONFIG_INITRAMFS_SOURCE))
> +cpio-data :=
> +
> +ifeq ($(words $(ramfs-input)),0)
> +
> +# If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
> +# default contents.
> +ramfs-input := $(srctree)/$(src)/default_cpio_list
> +
> +else ifeq ($(words $(ramfs-input)),1)
> +# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> +# .cpio or .cpio.*, use it directly as an initramfs.
> +ifneq ($(filter %.cpio,$(ramfs-input)),)
> +cpio-data := $(ramfs-input)
> +endif

This part will now work if the file is named foo.cpio.bar.
$(findstring .cpio, should be used and not $(filter %.cpio
At least if the comment describes the intended behaviour.

> +
> +ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
> +cpio-data := $(ramfs-input)
> +# If the specified archive is suffixed with .cpio.* (i.e. already compressed),
> +# we do not double-compress it.
> +compress-y := shipped
> +endif
> +
> +endif


	Sam
