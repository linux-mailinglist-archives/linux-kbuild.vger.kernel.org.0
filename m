Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9F0ADA3D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 15:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730109AbfIINsU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 09:48:20 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:64220 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbfIINsU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 09:48:20 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id D6F832823C;
        Mon,  9 Sep 2019 09:48:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=PPL3tsPzTCjx0UJ55+KB4byy/08=; b=HfBSz/
        INF8pkRHwV3efZ8mB9+b1v1XCNa26Er8EBT9zJyIhfppOGw9dHvu9yjMrql92Zl3
        ZL5O/PS1Yf32NRitygbaoT9YENTjdr8yJACbmJCFTfcQ3mDb1bCy6YKVCE2ALv9K
        5Xlhljdon/UpZeDhRYIpRd8t9KHiTy1vcDGBU=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id CF89F2823B;
        Mon,  9 Sep 2019 09:48:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=23ZJLxU481DjocaHI4wqPJqunWt7SkjVe1vkmCDbANA=; b=TGYs9VDY3vZ1PfWtkq8dDLtHwpDJB/QsgdSsumomNVqSekQX8XDIKO5KKKXYTuQtNi9w9hji2uhHMF/ky9Teg5O8QdIamZ1T5pYyBnAi8tAjU1wxbRVMOBBPqSROZDZYvhCOuVEfhGKVUVxROjOjlq77/00Rhdwgb+BZZLoAvQM=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 1243B2823A;
        Mon,  9 Sep 2019 09:48:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 37A812DA01B6;
        Mon,  9 Sep 2019 09:48:17 -0400 (EDT)
Date:   Mon, 9 Sep 2019 09:48:17 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
In-Reply-To: <20190909105317.20473-1-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 7A8F552A-D308-11E9-80F7-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 9 Sep 2019, Masahiro Yamada wrote:

> This line was touched by commit f235541699bc ("export.h: allow for
> per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> not explain why.
> 
> CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).

I'm pretty sure it was needed back then so not to interfere with users 
of this file. My fault for not documenting it.


Nicolas
