Return-Path: <linux-kbuild+bounces-9043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F01FEBC3085
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Oct 2025 02:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10FC4E33FD
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 00:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98041A5B8A;
	Wed,  8 Oct 2025 00:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b="OXvyU3fx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EAeIgmv3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB21A9FAE
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Oct 2025 00:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882204; cv=none; b=BuJIOnBP/EKtVPeogmC7ocqRmpnadSWH6dHJZ4SFZezU2s6EU5kQKtflhK0uh0WGVnkcvOh1p0TMRsJyTux5f/5bu8P/+pQXUNeCsDGcwmnnNOwG6q5AMWgaaARhBjQ8pDhJs1Bollo5Vie9Co3vJYyOEamhAjiBvmDmWS3mcC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882204; c=relaxed/simple;
	bh=3t+pTwaL8eeeP8H7hr9rZgiVh0KbjnAtYJ8nC5OKPd8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=txL+2AYUiWqIf98uBhNyGoavw5Ix1RO69JHfB3gKpKfu1Fk/XObSA+34kl08SxjZb07Q/MRLqMliy/gnSnsXp9JmOcjUoFsPjOb7THDYOUHtZsd15cIUgaBuD89iivyeMbGwjMBr+44/VsruXTpkjFWAecQmJr1x/qp4x5hjPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io; spf=pass smtp.mailfrom=likewhatevs.io; dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b=OXvyU3fx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EAeIgmv3; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=likewhatevs.io
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9B821EC0607;
	Tue,  7 Oct 2025 20:09:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 07 Oct 2025 20:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1759882198; x=1759968598; bh=mXDEJn01f7B8rxb8SYhgor+nwynZ7V9Z
	0AAlofedTMo=; b=OXvyU3fxySdSJJtsxUIhXhvi9zCLUvzuMHB7C2dbratosWXE
	QY+2Z5F+zEB/Ck2+Ujd7IjAk5dAlVTXqCsxP2PDLxz+QyuzmQ3mzfwVgv2BT8wcj
	7NEYouh3aIdRtY03KJo/8fJyu3bUHXYmdtLsxS3P35P2kNSubZ88EFNkYxD1m3y0
	4Gf38CBdurGauQWq9WVzMtds2gmBiJsHYFUhEYAaEjVeau1kNj0K/JqmwJ6zXNaX
	ZM+v5IxAMUPsyxLcbaAF6GAQDu/GVxUYvHcipwoTROZ7YH2yUvW5RERiRSvd/OBp
	7sm9nU05mvbDH7xU+5MOdV8yahQpigc7Ub6qvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759882198; x=
	1759968598; bh=mXDEJn01f7B8rxb8SYhgor+nwynZ7V9Z0AAlofedTMo=; b=E
	AeIgmv3P6chjjM+ovc5jNtMKv3qOcZJvgw8CN8MdW/Jtuf4j42z4K8OV6u3HgcWp
	R/9boOkfgcSQS4ZvfcLnKfWoEAfCtE6HsZdJOdma0nwhsLEVJ3+aUupn8q415YEV
	IjYPZt0+/Z+r3dCaJ08y5tSXHX7iiJl1we6XlX+CBZi3pRFFcM2cZUNuVj7dmvGI
	njLH+BkjpOG+mY6CXGgJBLbJRIukkVntyDS8kmmjsi3fwO4J5vBgGhqIlnVItNpc
	vg0UlB13f3bIqpqGrQQEHdwI7zJ1Vk2S9kBvyjThVjmzfybPXBesrv89lBwhDlk+
	NM5zUwDLxHYTPIunLQz7Q==
X-ME-Sender: <xms:1qvlaJZ2YqNbu9UAyozVgY7acSDwdXfVXGnOPyrYjM1i9ETGTnHFQA>
    <xme:1qvlaBGwbvyMDQ633jSHFoOgq6UMbmyefJOGTQGuPIhJrGaRev1DIW6nhRgyPJ_Au
    AEsyuziaJnU5pi6KEve_qxuN6U7yJcKX10B--pvaxnWBzq0m85eGL4>
X-ME-Received: <xmr:1qvlaKIRsUJ0MWs-kscDq5UUdwIYdeNbWA6K0kC4IQuTPdXyDAX6fa2j1ZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutddukedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfrfgrthcu
    ufhomhgrrhhufdcuoehprghtshhosehlihhkvgifhhgrthgvvhhsrdhioheqnecuggftrf
    grthhtvghrnhepveffieeugeehleehjeekleekiedtiedvledvveehheegueeiveffkeev
    heefffffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgrthhsoheslhhikhgvfihhrghtvghvshdrihhopdhnsggprhgtphhtthhopeejpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhorhgsohesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkh
    hmlhesghhmrghilhdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhu
    gidruggvvh
X-ME-Proxy: <xmx:1qvlaMNt4YrXixP1ewuAU8cjY_3hAT7UmXlCTJuFb6fleUkCnV2fpw>
    <xmx:1qvlaKlJN2h1ncI9Pu7CPruoYd-B9PjsmZS473TphhUWgOcSZ5FenQ>
    <xmx:1qvlaA4u7Q-R8796VKHDIdR_bjh1EAooA6jDb8K3MwZBy_w_AHU2kQ>
    <xmx:1qvlaO3t0QvDtPrSOgzthLqUb8gbVpICn6J6C-poOvbR63pspWOWaQ>
    <xmx:1qvlaF90E9kmXlWrZQB6K3J_xexG9SkGvTG-tsaON1H-_3Md3PqrMjTO>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Oct 2025 20:09:58 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 20:09:57 -0400
Message-Id: <DDCI68JLD5RP.1WAN6YKP7WWNU@likewhatevs.io>
Cc: "Nathan Chancellor" <nathan@kernel.org>, <linux-kbuild@vger.kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "clang-built-linux"
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] scripts/clang-tools: Handle included .c files in
 gen_compile_commands
From: "Pat Somaru" <patso@likewhatevs.io>
To: "Justin Stitt" <justinstitt@google.com>
X-Mailer: aerc 0.20.1
References: <20251007024527.1439747-1-patso@likewhatevs.io>
 <be6kxu36uphlnhedsi7gsayhuetmqixil4dv2lxe4plvgyqewx@jecdpummb52l>
 <CAFhGd8quQ3i9wEGOJNxy5s_MuD=WdxwqL15qB1i=KY8fW1Cf_Q@mail.gmail.com>
In-Reply-To: <CAFhGd8quQ3i9wEGOJNxy5s_MuD=WdxwqL15qB1i=KY8fW1Cf_Q@mail.gmail.com>

Hi folks,

Thanks for the feedback so far!

>> I realize this script is not ran often but maybe there is some heurstic
>> or speedup that can be made to the regex.

I'll send a revision with this in a bit, thank you for the idea and
noticing this! On my machine, v1 of this patch runs in ~900ms, v2 runs
in 500ms and no patch runs in 400ms. I also confirmed v2 outputs an
identical json to that v1 does.

>>> However, my initial gut reaction is that I do not like this additional
>>> complexity.=20

I don't see other ways to get LSP working, but admittedly, this is my first=
=20
foray into kernel stuff. I kinda see a way to enable making LSP work via=20
ifdef's, but I doubt folks would be OK with that at all. I can try differen=
t=20
ideas if folks have any.

>>> I do see a number of files that include .c files so it may be worth=20
>>> supporting this still but it feels like this heuristic could be
>>> fragile, especially since aside from clangd, we have no real way to
>>> validate that these files actually build correctly in the way that
>>> compile_commands.json describes.

I think the following helps with this, I ran cppcheck (i.e., not clangd)
against my local checkout with both pre-patch and post-patch=20
compile_commands.json to get some signal on this:

=3D=3D=3D=3D
$ cppcheck --project=3D../old_compile_commands.json 2>&1 | tail
...
Checking virt/lib/irqbypass.c ...
2668/2668 files checked 100% done
$ cppcheck --project=3D../old_compile_commands.json 2>&1 | grep -E 'error:|=
warning:' | wc -l
5
$ cppcheck --project=3D../new_compile_commands.json 2>&1 | tail
...
Checking virt/lib/irqbypass.c ...
2821/2821 files checked 100% done
$ cppcheck --project=3D../new_compile_commands.json 2>&1 | grep -E 'error:|=
warning:' | wc -l
7
=3D=3D=3D=3D

Additionally, I wrapped clangd in a script and collected some data on how
it performs with the various compile_commands.json to help illustrate the=
=20
properties of this patch:

=3D=3D=3D=3D
script output with newly included files and old compile_commands.json (i.e.=
 what folks encounter working on these files now):
files: 2820
clangd errors: 58452
clangd fatal_too_many_errors: 195
clangd timeouts: 36

script output with new compile_commands.json:
files: 2820
clangd errors: 58763
clangd fatal_too_many_errors: 164
clangd timeouts: 39

script output with old compile_commands.json:
files: 2667
clangd errors: 55995
clangd fatal_too_many_errors: 118
clangd timeouts: 36
=3D=3D=3D=3D

Thank you for the feedback so far and for maintaining this wonderful
script. LSP makes kernel stuff like 10x more accessible!


On Tue Oct 7, 2025 at 3:59 PM EDT, Justin Stitt wrote:
> I seem to have dropped some folks from the CC list somehow (probably
> wrong mutt keybind).
>
> I've self-quoted myself below to preserve context.
>
> On Tue, Oct 7, 2025 at 12:55=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
>>
>> Hi,
>>
>> On Mon, Oct 06, 2025 at 10:45:27PM -0400, Pat Somaru wrote:
>> > The gen_compile_commands.py script currently only creates entries for =
the
>> > primary source files found in .cmd files, but some kernel source files
>> > text-include others (i.e. kernel/sched/build_policy.c).
>> >
>> > This prevents tools like clangd from working properly on text-included=
 c
>> > files, such as kernel/sched/ext.c because the generated compile_comman=
ds.json
>> > does not have entries for them.
>> >
>> > Extend process_line() to detect when a source file includes .c files, =
and
>> > generate additional compile_commands.json entries for them. For includ=
ed c
>> > files, use the same compile flags as their parent and add their parent=
s headers.
>> >
>> > This enables lsp tools like clangd to work properly on files like
>> > kernel/sched/ext.c
>> >
>> > Signed-off-by: Pat Somaru <patso@likewhatevs.io>
>>
>> FWIW, I tested this out and my clangd was much happier dealing with
>> kernel/sched/ext.c. Nathan's points are still valid, I'm just giving
>> user feedback.
>>
>> After benchmarking the script itself, I saw some performance hits:
>>
>> pre-patch, 5x run average: 0.590 seconds
>> post-patch, 5x run average: 2.164 seconds
>>
>> With this simple invocation:
>>
>>   ./scripts/clang-tools/gen_compile_commands.py -d build-master -o $TMP/=
compile_commands.json
>>
>> I realize this script is not ran often but maybe there is some heurstic
>> or speedup that can be made to the regex.
>>
>> Tested-by: Justin Stitt <justinstitt@google.com>
>>
>> > ---
>> >  scripts/clang-tools/gen_compile_commands.py | 126 +++++++++++++++++++=
-
>> >  1 file changed, 121 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/cla=
ng-tools/gen_compile_commands.py
>> > index 96e6e46ad1a70..02791efdc06d0 100755
>> > --- a/scripts/clang-tools/gen_compile_commands.py
>> > +++ b/scripts/clang-tools/gen_compile_commands.py
>> > @@ -149,8 +149,87 @@ def cmdfiles_for_modorder(modorder):
>> >                      yield to_cmdfile(mod_line.rstrip())
>> >
>> >
>> > +def extract_includes_from_file(source_file, root_directory):
>> > +    """Extract #include statements from a C file.
>> > +
>> > +    Args:
>> > +        source_file: Path to the source .c file to analyze
>> > +        root_directory: Root directory for resolving relative paths
>> > +
>> > +    Returns:
>> > +        List of header files that should be included (without quotes/=
brackets)
>> > +    """
>> > +    includes =3D []
>> > +    if not os.path.exists(source_file):
>> > +        return includes
>> > +
>> > +    try:
>> > +        with open(source_file, 'r') as f:
>> > +            for line in f:
>> > +                line =3D line.strip()
>> > +                # Look for #include statements.
>> > +                # Match both #include "header.h" and #include <header=
.h>.
>> > +                match =3D re.match(r'^\s*#\s*include\s*[<"]([^>"]*)[>=
"]', line)
>> > +                if match:
>> > +                    header =3D match.group(1)
>> > +                    # Skip including other .c files to avoid circular=
 includes.
>> > +                    if not header.endswith('.c'):
>> > +                        # For relative includes (quoted), resolve pat=
h relative to source file.
>> > +                        if '"' in line:
>> > +                            src_dir =3D os.path.dirname(source_file)
>> > +                            header_path =3D os.path.join(src_dir, hea=
der)
>> > +                            if os.path.exists(header_path):
>> > +                                rel_header =3D os.path.relpath(header=
_path, root_directory)
>> > +                                includes.append(rel_header)
>> > +                            else:
>> > +                                includes.append(header)
>> > +                        else:
>> > +                            # System include like <linux/sched.h>.
>> > +                            includes.append(header)
>> > +    except IOError:
>> > +        pass
>> > +
>> > +    return includes
>> > +
>> > +
>> > +def find_included_c_files(source_file, root_directory):
>> > +    """Find .c files that are included by the given source file.
>> > +
>> > +    Args:
>> > +        source_file: Path to the source .c file
>> > +        root_directory: Root directory for resolving relative paths
>> > +
>> > +    Yields:
>> > +        Full paths to included .c files
>> > +    """
>> > +    if not os.path.exists(source_file):
>> > +        return
>> > +
>> > +    try:
>> > +        with open(source_file, 'r') as f:
>> > +            for line in f:
>> > +                line =3D line.strip()
>> > +                # Look for #include "*.c" patterns.
>> > +                match =3D re.match(r'^\s*#\s*include\s*"([^"]*\.c)"\s=
*$', line)
>> > +                if match:
>> > +                    included_file =3D match.group(1)
>> > +                    # Handle relative paths.
>> > +                    if not os.path.isabs(included_file):
>> > +                        src_dir =3D os.path.dirname(source_file)
>> > +                        included_file =3D os.path.join(src_dir, inclu=
ded_file)
>> > +
>> > +                    # Normalize the path.
>> > +                    included_file =3D os.path.normpath(included_file)
>> > +
>> > +                    # Check if the file exists.
>> > +                    if os.path.exists(included_file):
>> > +                        yield included_file
>> > +    except IOError:
>> > +        pass
>> > +
>> > +
>> >  def process_line(root_directory, command_prefix, file_path):
>> > -    """Extracts information from a .cmd line and creates an entry fro=
m it.
>> > +    """Extracts information from a .cmd line and creates entries from=
 it.
>> >
>> >      Args:
>> >          root_directory: The directory that was searched for .cmd file=
s. Usually
>> > @@ -160,7 +239,8 @@ def process_line(root_directory, command_prefix, f=
ile_path):
>> >              Usually relative to root_directory, but sometimes absolut=
e.
>> >
>> >      Returns:
>> > -        An entry to append to compile_commands.
>> > +        A list of entries to append to compile_commands (may include =
multiple
>> > +        entries if the source file includes other .c files).
>> >
>> >      Raises:
>> >          ValueError: Could not find the extracted file based on file_p=
ath and
>> > @@ -176,11 +256,47 @@ def process_line(root_directory, command_prefix,=
 file_path):
>> >      abs_path =3D os.path.realpath(os.path.join(root_directory, file_p=
ath))
>> >      if not os.path.exists(abs_path):
>> >          raise ValueError('File %s not found' % abs_path)
>> > -    return {
>> > +
>> > +    entries =3D []
>> > +
>> > +    # Create entry for the main source file.
>> > +    main_entry =3D {
>> >          'directory': root_directory,
>> >          'file': abs_path,
>> >          'command': prefix + file_path,
>> >      }
>> > +    entries.append(main_entry)
>> > +
>> > +    # Find and create entries for included .c files.
>> > +    for included_c_file in find_included_c_files(abs_path, root_direc=
tory):
>> > +        # For included .c files, create a compilation command that:
>> > +        # 1. Uses the same compilation flags as the parent file
>> > +        # 2. But compiles the included file directly (not the parent)
>> > +        # 3. Includes necessary headers from the parent file for prop=
er macro resolution
>> > +
>> > +        # Convert absolute path to relative for the command.
>> > +        rel_path =3D os.path.relpath(included_c_file, root_directory)
>> > +
>> > +        # Extract includes from the parent file to provide proper com=
pilation context.
>> > +        extra_includes =3D ''
>> > +        try:
>> > +            parent_includes =3D extract_includes_from_file(abs_path, =
root_directory)
>> > +            if parent_includes:
>> > +                extra_includes =3D ' ' + ' '.join('-include ' + inc f=
or inc in parent_includes)
>> > +        except IOError:
>> > +            pass
>> > +
>> > +        included_entry =3D {
>> > +            'directory': root_directory,
>> > +            'file': included_c_file,
>> > +            # Use the same compilation prefix but target the included=
 file directly.
>> > +            # Add extra headers for proper macro resolution.
>> > +            'command': prefix + extra_includes + ' ' + rel_path,
>> > +        }
>> > +        entries.append(included_entry)
>> > +        logging.debug('Added entry for included file: %s', included_c=
_file)
>> > +
>> > +    return entries
>> >
>> >
>> >  def main():
>> > @@ -213,9 +329,9 @@ def main():
>> >                  result =3D line_matcher.match(f.readline())
>> >                  if result:
>> >                      try:
>> > -                        entry =3D process_line(directory, result.grou=
p('command_prefix'),
>> > +                        entries =3D process_line(directory, result.gr=
oup('command_prefix'),
>> >                                               result.group('file_path'=
))
>> > -                        compile_commands.append(entry)
>> > +                        compile_commands.extend(entries)
>> >                      except ValueError as err:
>> >                          logging.info('Could not add line from %s: %s'=
,
>> >                                       cmdfile, err)
>> > --
>> > 2.51.0
>> >
>> >
>>
>> Thanks
>> Justin


