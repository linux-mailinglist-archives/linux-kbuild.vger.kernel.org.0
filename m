Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F5D2F57DC
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 04:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbhANCKc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 21:10:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28314 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729250AbhAMWWt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 17:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610576478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=t343ybiazYo2WtvCjU7Ts19VKzTmTogn/vAlmRldwVc=;
        b=b1uCit51fiwkwjj1n0Fi3Dergl0wrNCeEccEJJNVDf7EPxZjl8gS6K7GC07GNeoVIQrWR8
        ju50p+BXpHdC+iyunwLCCO8UElUaLxLpVb8HOccF1xP7NK7Bhj11r9ziIPCsz4cA7AVlmd
        b5njhJGyDeQOAB0pIRHRuLzm+uSPRQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-CAXIf4SaNXuUxloxnEFeWA-1; Wed, 13 Jan 2021 17:21:16 -0500
X-MC-Unique: CAXIf4SaNXuUxloxnEFeWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D4C801FCC;
        Wed, 13 Jan 2021 22:21:15 +0000 (UTC)
Received: from treble (ovpn-120-156.rdu2.redhat.com [10.10.120.156])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9310D6F969;
        Wed, 13 Jan 2021 22:21:14 +0000 (UTC)
Date:   Wed, 13 Jan 2021 16:21:12 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Toolchain-dependent config options
Message-ID: <20210113222112.ej4rrd5xw2pwegvw@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

If I copy a config with CONFIG_GCC_PLUGINS to another system which
doesn't have the gcc-plugin-devel package, it gets silently disabled by
"make olddefconfig".

I've seen multiple cases lately where this is causing confusion.  I
suspect the problem is getting worse with recent added support for a
variety of toolchains and toolchain-dependent features.

Would it be possible to have an error (or at least a warning) in this
case?

For example, a "depends-error" which triggers an error if its failure
would disable a feature?

-- 
Josh

