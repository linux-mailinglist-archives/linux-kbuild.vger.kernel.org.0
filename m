Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5347D1D2E64
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2020 13:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENLfE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 May 2020 07:35:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58437 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725925AbgENLfE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 07:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589456102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=oN+tnBbDKf4f0knAwOaUwUK3LWi0S044igL/voA/EAA=;
        b=CQORmTxIk6rWdHh/j0RgUFk8uHkmZiBoqlAlrzBltzIwRohV5t1hUkJKkzFdbWf1v8CQ/a
        /5/j9nfPKTL4M/c3YEWRaIzYbL7dVsepKGZn2gjMh9Ysj71I5OluBqRZu+4h0hqJq9zLAO
        qZ1fO94O1DORAGErjsYCXGiilarWEpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-8U7m8sOpPqS1_Nr3t9U4uw-1; Thu, 14 May 2020 07:34:59 -0400
X-MC-Unique: 8U7m8sOpPqS1_Nr3t9U4uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A18D68015D2;
        Thu, 14 May 2020 11:34:57 +0000 (UTC)
Received: from [10.36.114.73] (ovpn-114-73.ams2.redhat.com [10.36.114.73])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E5DB910013BD;
        Thu, 14 May 2020 11:34:54 +0000 (UTC)
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com>
 <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
 <20200512200114.64vo5lbl7wk2tzxk@google.com>
 <CAKwvOdnArcsqusvmMDUJyTjVhkOufJZoRHxg-ARDfPhfjNj_JA@mail.gmail.com>
From:   Nick Clifton <nickc@redhat.com>
Autocrypt: addr=nickc@redhat.com; prefer-encrypt=mutual; keydata=
 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
 6susi2ReUyNJEJaSnjO5z13TQ1U=
Organization: Red Hat
Subject: Re: [PATCH] Makefile: support compressed debug info
Message-ID: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
Date:   Thu, 14 May 2020 12:34:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnArcsqusvmMDUJyTjVhkOufJZoRHxg-ARDfPhfjNj_JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,

> + Nick, H.J.
> I'm unfamiliar with the git tag conventions of binutils.  Does a patch
> that landed in 2.25.51.0.4 mean it shipped in the official 2.25
> release, or 2.26 release?  Specifically, commit 19a7fe52ae3d.

2.26.

The convention is that a released form of the binutils has a version
number of X.XX or possible X.XX.N.  The current mainline development 
sources have a version of X.XX.50 where X.XX is the latest release.
(So the current mainline sources are version 2.34.50).  When a release
happens the XX value is incremented by one as part of the release
process, and the .50 is dropped.  (So the next binutils release will 
be 2.35).

So 2.25.51.0.4 is a development version which will then have been
released as binutils 2.26.

Cheers
  Nick

