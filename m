Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C9F35FBCF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349141AbhDNTpp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347936AbhDNTpo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:45:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A4EC061574;
        Wed, 14 Apr 2021 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gli4OQgNBy4Y7eTH9cJneL6jzKQeus+YAS1EFmNv1Hg=; b=EQXXk6xBvoPl5/lwskuCNB/K2A
        nf6fMzNmzNkwo1/Agd5C2Zg/hZcMWlUHj3lzqTFlal+axjZ0qdN0kZYU4qJYG1r7OnfGMEkVdif2z
        EjlibfSI0HbuAG+lR9i82Wbzo3B7RxLKQCIsHiuy7eXOZN3Dgvk/WjtWJM17VG99RbYWcycMmZnXx
        uCJiOd19nK8idbSXx5m6ShEptIIjtsrSL1FwoxptLrp68hixsxNJ3TfTUKI0j4nG5iuU27PHXiO71
        3IQrzTaPTzHVw5ClbA5prDkRIJ89c0qIvmTvCgyIm9vQ6G7Uigrnc3bmBc95k41o/Z0CpEFG4sSOv
        N3xrRztw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lWlRW-007YIZ-3c; Wed, 14 Apr 2021 19:45:04 +0000
Date:   Wed, 14 Apr 2021 20:44:54 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/13] kallsyms: Support "big" kernel symbols (2-byte
 lengths)
Message-ID: <20210414194454.GV2531743@casper.infradead.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-2-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184604.23473-2-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 08:45:52PM +0200, ojeda@kernel.org wrote:
> Increasing to 255 is not enough in some cases, and therefore
> we need to introduce 2-byte lengths to the symbol table. We call
> these "big" symbols.
> 
> In order to avoid increasing all lengths to 2 bytes (since most
> of them only require 1 byte, including many Rust ones), we use
> length zero to mark "big" symbols in the table.

How about doing something a bit more utf-8-like?

	len = data[0];
	if (len == 0)
		error
	else if (len < 128)
		return len;
	else if (len < 192)
		return 128 + (len - 128) * 256 + data[1];
... that takes you all the way out to 16511 bytes.  You probably don't
even need the third byte option.  But if you do ...
	else if (len < 223)
		return 16512 + (len - 192) * 256 * 256 +
			data[1] * 256 + data[2];
which takes you all the way out to 2,113,663 bytes and leaves 224-255 unused.

Alternatively, if the symbols are really this long, perhaps we should not
do string matches.  A sha-1 (... or whatever ...) hash of the function
name is 160 bits.  Expressed as hex digits, that's 40 characters.
Expressed in base-64, it's 27 characters.  We'd also want a "pretty"
name to go along with the hash, but that seems preferable to printing
out a mangled-with-types-and-who-knows-what name.

> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

If you have C-d-b, you don't also need S-o-b.

